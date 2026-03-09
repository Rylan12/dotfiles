export CLICOLOR=1

command_exists rslprompt || return

eval "$(rslprompt init zsh)"
