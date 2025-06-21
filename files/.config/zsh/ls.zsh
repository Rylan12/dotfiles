# Return if bat is not installed
command_exists eza || return

alias ls='eza'
alias l='ls'
alias ll='ls -l'
alias la='ls -la'
alias l.='ls -d .*'
alias ll.='ls -ld .*'
