# Return if gh is not installed
command_exists gh || return

# GitHub copilot CLI
if gh extension list | grep -q copilot; then
  _evalcache gh copilot alias -- zsh
fi

alias gh='PAGER= gh' # remove pager
alias prc='gh pr checkout'
alias prv='gh pr view'
alias prvw='gh pr view -w' # open PR in web browser
alias rpv='gh repo view'
alias rpvw='gh repo view -w' # open repo in web browser
