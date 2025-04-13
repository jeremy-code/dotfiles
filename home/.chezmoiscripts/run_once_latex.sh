#!/usr/bin/env zsh
#
# In Homebrew, the options for installing TeX Live for macOS seem to be (1)
# mactex (2) mactex-no-gui (3) texlive (4) basictex. The first three options
# seem to be pretty large installations, with them all being over 3 GB.
# Comparatively, basictex is only 200 MB. However, many packages are naturally
# not included in basictex.
#
# Installing packages in LaTeX seems opposed to the idea of dotfiles. By
# default, the LaTeX package manager is `tlmgr`.  System packages are stored in
# /Library/TeX/texbin/*. While there is a "user mode" in `tlmgr`, it
# deliberately only allows installation of "relocatable" packages, which
# excludes packages containing executables. Since `latexmk` is necessary for
# usage withe the VSCode extension, installation will be done here.
#
# https://amandastjerna.se/memex/texlive-minimalist-survival-guide/
# https://github.com/spl/homebrew-tex

PACKAGES=(
  "algorithms" # algorithm and algorithmic
  "chktex"
  "comment"
  "latexmk"
  "pgfplots"
)

function {
  echo "Starting LaTeX package installation..."
  echo "Checking if TeX Live is installed..."

  if command -v tlmgr &> /dev/null; then
    echo "TeX Live is already installed at $(where tlmgr)"
  else
    echo "TeX Live is not installed. Exiting..."
    return 1
  fi

  echo "Checking if TeX Live package manager needs to be updated..."

  no_updates_available="$(
    tlmgr update --self --list \
      | grep --count --max-count=1 "tlmgr: no self-updates for tlmgr available"
  )"

  if [[ ${no_updates_available} ]]; then
    echo "No updates available for TeX Live package manager. Skipping update..."
  else
    echo "Updating TeX Live package manager..."
    sudo tlmgr update --self # Update the TeX Live package manager
  fi

  echo "Checking if TeX Live packages..."

  noninstalled_package_json="$(
    tlmgr info --only-installed --json ${PACKAGES[@]} \
      | jq -r "map(select((.installed == false) or (.available == false))) | map({key: .name, value: .}) | from_entries | tojson"
  )"

  if [[ "${noninstalled_package_json}" == "{}" ]]; then
    echo "All LaTeX packages are already installed. Exiting..."
    exit 0
  fi

  noninstalled_packages=(
    "${(f)$(jq -r -c 'keys[]' <<< ${noninstalled_package_json})}"
  )

  echo "The following LaTeX packages are not installed or not available: ${noninstalled_packages[@]}"

  for package in "${noninstalled_packages[@]}"; do
    echo "Checking availability of LaTeX package: ${package}..."
    package_info="$(
      jq -r ".${package}" <<< "${noninstalled_package_json}"
    )"

    if [[ $(jq -r ".available" <<< "${package_info}") == false ]]; then
      echo "Package ${package} is not available. Skipping installation..."
      continue
    fi

    package_version="$(jq -r '.cataloguedata.version' <<< "${package_info}")"

    echo "Package ${package} version ${package_version} is available. Installing..."

    sudo tlmgr install "${package}"

    if (($? != 0)); then
      echo "Unable to install package ${package}. Exiting..."
      exit 1
    fi
    echo "Package ${package} version ${package_version} installed successfully"
  done

  echo "LaTeX package installation completed successfully"
}
