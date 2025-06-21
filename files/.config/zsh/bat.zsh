# Return if bat is not installed
command_exists bat || return

alias cat='bat'
alias man='batman'
alias diff='batdiff --color=auto'
alias brg='batgrep --color=auto'

compdef _man batman
