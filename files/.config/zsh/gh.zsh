# Return if gh is not installed
command_exists gh || return

alias gh='PAGER= gh' # remove pager
alias prc='gh pr checkout'
alias prv='gh pr view'
alias prvw='gh pr view -w' # open PR in web browser
alias rpv='gh repo view'
alias rpvw='gh repo view -w' # open repo in web browser
