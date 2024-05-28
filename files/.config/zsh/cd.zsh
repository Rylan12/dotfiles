alias cdgr='cd "$(git root)"'
alias cddf='cd "$HOME/.dotfiles/"'
alias des='cd "$HOME/Desktop/"'
alias dev='cd "$HOME/Development/"'
alias doc='cd "$HOME/Documents/"'
alias dow='cd "$HOME/Downloads/"'
alias hom='cd "$HOME/Development/homebrew/"'
alias brepo='cd /opt/homebrew'
alias bcore='cd /opt/homebrew/Library/Taps/homebrew/homebrew-core/'
alias bcask='cd /opt/homebrew/Library/Taps/homebrew/homebrew-cask/'
alias cellar='cd /opt/homebrew/Cellar/'
alias caskroom='cd /opt/homebrew/Caskroom/'
cdb() {
    cd "$(brew --repository $1)"
}
alias cdbl='cd $(brew --repository)/Library/Homebrew'
