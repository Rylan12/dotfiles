alias cdgr='cd "$(git root)"'
alias cddf="cd '$HOME/.dotfiles/'"
alias des="cd '$HOME/Desktop/'"
alias dev="cd '$HOME/Development/'"
alias doc="cd '$HOME/Documents/'"
alias dow="cd '$HOME/Downloads/'"
alias hom="cd '$HOME/Development/homebrew/'"
alias brepo="cd '$HOMEBREW_PREFIX'"
alias bcore="cd '$HOMEBREW_PREFIX/Library/Taps/homebrew/homebrew-core/'"
alias bcask="cd '$HOMEBREW_PREFIX/Library/Taps/homebrew/homebrew-cask/'"
alias cellar="cd '$HOMEBREW_PREFIX/Cellar/'"
alias caskroom="cd '$HOMEBREW_PREFIX/Caskroom/'"
cdb() {
    cd "$(brew --repository $1)"
}
alias cdbl="cd $HOMEBREW_PREFIX/Library/Homebrew"
