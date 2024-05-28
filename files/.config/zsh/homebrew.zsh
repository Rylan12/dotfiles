export HOMEBREW_BAT=1
export HOMEBREW_BOOTSNAP=1
export HOMEBREW_DEVELOPER=1
export HOMEBREW_FORCE_BREWED_GIT=1
export HOMEBREW_GITHUB_PACKAGES_USER="Rylan12"
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_PRY=1
eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
