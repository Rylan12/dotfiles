# Only alias ls if eza is installed
if command_exists eza; then
  alias ls='eza'
fi

alias l='ls'
alias ll='ls -l'
alias la='ls -la'
alias l.='ls -d .*'
alias ll.='ls -ld .*'
