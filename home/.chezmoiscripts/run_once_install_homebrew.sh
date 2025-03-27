#!/usr/bin/env zsh

# Installs Homebrew package manager on MacOS and Linux if it is not already
# installed.
function {
  if command -v brew &>/dev/null; then
    echo "Homebrew is already installed at $(where brew). Skipping installation..."
  else
    echo "Installing Homebrew..."
    local OS="$(uname)"

    case $OS in
      "Darwin")
        # Install with `.pkg` installer, introduced in Homebrew 4.1.2. Since
        # Apple requires by default that all software installed via `installer`
        # is signed by a developer certificate issued by Apple, I consider this
        # method more secure than running the convenience script.
        echo "Detected MacOS, installing with .pkg..."

        local HOMEBREW_PKG_PATH="/tmp/homebrew.pkg"

        curl --fail --location --show-error --silent "https://api.github.com/repos/Homebrew/brew/releases/latest" |
        jq --raw-output ".assets[].browser_download_url" |
        grep -E "^https:\/\/github\.com\/Homebrew\/brew\/releases\/download\/(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)\/Homebrew-\1\.\2\.\3\.pkg$" |
        xargs curl --fail --location --show-error --silent --output $HOMEBREW_PKG_PATH

        if [[ -f "$HOMEBREW_PKG_PATH" ]]; then
          echo "Homebrew package installer downloaded to $HOMEBREW_PKG_PATH"
        else
          echo "Homebrew package installer download failed. File was not found at $HOMEBREW_PKG_PATH. Exiting..."
          exit 1
        fi

        echo "Installing Homebrew at root volume mount point /..."
        sudo installer -package $HOMEBREW_PKG_DIR -target "/"

        if command pkgutil --pkg-info "sh.brew.homebrew" &>/dev/null; then
          echo "Homebrew installed successfully."
          rm -f -v $HOMEBREW_PKG_PATH
        else
          echo "Homebrew installation failed. Please confirm if the file at $HOMEBREW_PKG_PATH is a valid package. You may download the .pkg file manually at https://github.com/Homebrew/brew/releases/latest."
          exit 1
        fi
        ;;
      "Linux")
        # Install with shell script (https://github.com/Homebrew/install/)
        echo "Detected Linux, installing with Bash shell script..."
        NONINTERACTIVE=1 /bin/bash -c "$(
          curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
        )"
        echo "Installation script ran successfully. Exiting..."
        ;;
      *)
        echo "You are using $OS. Homebrew is only supported on macOS and Linux. Exiting..."
        exit 1
        ;;
    esac
  fi
}
