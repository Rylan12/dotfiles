# Check if Homebrew is installed by checking the following locations:
# 1. The `brew` command is available in the PATH
# 2. The HOMEBREW_PREFIX environment variable is set and points to a valid Homebrew installation
# 3. The default Homebrew installation paths for macOS and Linux
if command_exists brew; then
  HOMEBREW_EXECUTABLE="$(command -v brew)"
elif [[ -n "${HOMEBREW_PREFIX-}" && -f "${HOMEBREW_PREFIX}/bin/brew" ]]; then
  HOMEBREW_EXECUTABLE="${HOMEBREW_PREFIX}/bin/brew"
elif [[ -f /opt/homebrew/bin/brew ]]; then
  HOMEBREW_EXECUTABLE="/opt/homebrew/bin/brew"
elif [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  HOMEBREW_EXECUTABLE="/home/linuxbrew/.linuxbrew/bin/brew"
fi

# If there's no Homebrew executable found, exit
if [[ -z "${HOMEBREW_EXECUTABLE-}" ]]; then
  printf 'Warning: Homebrew was not found. This will likely cause issues with your shell setup.\n'
  return 1
fi

export HOMEBREW_BAT=1
export HOMEBREW_BOOTSNAP=1
export HOMEBREW_DOWNLOAD_CONCURRENCY="auto"
export HOMEBREW_DEVELOPER=1
export HOMEBREW_FORCE_BREWED_GIT=1
export HOMEBREW_GITHUB_PACKAGES_USER="Rylan12"
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_HINTS=1
eval "$($HOMEBREW_EXECUTABLE shellenv)"

# If brew was already in the PATH before running `brew shellenv`, `HOMEBREW_PREFIX` will not be set.
if [[ -z "${HOMEBREW_PREFIX-}" ]]; then
  HOMEBREW_PREFIX="$(brew --prefix)"
fi

FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:$FPATH"

alias -g APIOFF='HOMEBREW_NO_INSTALL_FROM_API=1'
