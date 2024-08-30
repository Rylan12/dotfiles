export HOMEBREW_BAT=1
export HOMEBREW_BOOTSNAP=1
export HOMEBREW_DEVELOPER=1
export HOMEBREW_FORCE_BREWED_GIT=1
export HOMEBREW_GITHUB_PACKAGES_USER="Rylan12"
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_HINTS=1
eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

alias -g APIOFF='HOMEBREW_NO_INSTALL_FROM_API=1'
