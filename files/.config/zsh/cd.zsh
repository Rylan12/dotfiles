alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'
alias uuuu='cd ../../../..'
alias uuuuu='cd ../../../../..'
alias uuuuuu='cd ../../../../../..'
alias uuuuuuu='cd ../../../../../../..'

alias cdgr='cd "$(git root)"'
alias cddf="cd '$HOME/.dotfiles/'"
alias des="cd '$HOME/Desktop/'"
alias doc="cd '$HOME/Documents/'"
alias dow="cd '$HOME/Downloads/'"

# Personal machine aliases
if personal_machine; then
  alias dev="cd '$HOME/Developer/'"
  alias hom="cd '$HOME/Developer/homebrew/'"
  alias prj="cd '$HOME/Projects/'"
  alias brepo="cd '$HOMEBREW_PREFIX'"
  alias bcore="cd '$HOMEBREW_PREFIX/Library/Taps/homebrew/homebrew-core/'"
  alias bcask="cd '$HOMEBREW_PREFIX/Library/Taps/homebrew/homebrew-cask/'"
  alias cellar="cd '$HOMEBREW_PREFIX/Cellar/'"
  alias caskroom="cd '$HOMEBREW_PREFIX/Caskroom/'"
  cdb() {
    cd "$(brew --repository $1)"
  }
  alias cdbl="cd $HOMEBREW_PREFIX/Library/Homebrew"
fi

# Shopify machine aliases
if shopify_machine; then
  alias plans="cd '$HOME/Plans/'"
fi
