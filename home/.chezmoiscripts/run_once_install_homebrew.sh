#!/bin/zsh
#
# Installs Homebrew package manager on MacOS and Linux if it is not already
# installed.

readonly HOMEBREW_PKG_PATH="/tmp/homebrew.pkg"
readonly HOMEBREW_RELEASE_PKG_REGEX="^https:\/\/github\.com\/Homebrew\/brew\/releases\/download\/(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)\/Homebrew-\1\.\2\.\3\.pkg$"

function error() {
  echo "[$(date "+%Y-%m-%dT%H:%M:%S%z")]: $*" >&2
}

function {
  if command -v brew &>/dev/null; then
    echo "Homebrew is already installed at $(where brew). Skipping installation..."
  else
    echo "Installing Homebrew..."
    local OS="$(uname)"

    case "${OS}" in
      "Darwin")
        # Install with `.pkg` installer, introduced in Homebrew 4.1.2. Since
        # Apple requires by default that all software installed via `installer`
        # is signed by a developer certificate issued by Apple, I consider this
        # method more secure than running the convenience script.
        echo "Detected MacOS, installing with .pkg..."

        # Note that this requires `jq`, which is installed by default on macOS
        # Sequoia (15) at `/usr/bin/jq`. Since the RegEx is already verbose
        # enough to find the URL without parsing the JSON, using `jq` is not
        # strictly necessary
        curl --fail --location --show-error --silent "https://api.github.com/repos/Homebrew/brew/releases/latest" \
          | jq --raw-output ".assets[].browser_download_url" \
          | grep -E "${HOMEBREW_RELEASE_PKG_REGEX}" \
          | xargs curl --fail --location --show-error --silent --output "${HOMEBREW_PKG_PATH}"

        if (( PIPESTATUS[0] != 0 || PIPESTATUS[1] != 0 || PIPESTATUS[2] != 0 || PIPESTATUS[3] != 0 )); then
          error "Homebrew package installer download failed. Exiting..."
          return 1
        fi

        if [[ -f "${HOMEBREW_PKG_PATH}" ]]; then
          echo "Homebrew package installer downloaded to ${HOMEBREW_PKG_PATH}"
        else
          error "Homebrew package installer download failed. File was not found at ${HOMEBREW_PKG_PATH}. Exiting..."
          return 1
        fi

        echo "Installing Homebrew at root volume mount point /..."
        sudo installer -package "${HOMEBREW_PKG_DIR}" -target "/"

        if command pkgutil --pkg-info "sh.brew.homebrew" &>/dev/null; then
          echo "Homebrew installed successfully."
          rm -f -v "${HOMEBREW_PKG_PATH}"
        else
          error "Homebrew installation failed. Please confirm if the file at \
${HOMEBREW_PKG_PATH} is a valid package. You may download the .pkg file manually \
at https://github.com/Homebrew/brew/releases/latest."
          return 1
        fi
        ;;
      "Linux")
        # Install with Bash shell script (https://github.com/Homebrew/install/)
        echo "Detected Linux, installing with Bash shell script..."
        NONINTERACTIVE=1 /bin/bash -c "$(
          curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
        )"
        echo "Installation script ran successfully. Exiting..."
        ;;
      *)
        error "Unexpected OS: ${OS}. Homebrew is only supported on macOS and Linux. Exiting..."
        return 1
        ;;
    esac
  fi
}
