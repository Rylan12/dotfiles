# Return if mise is not installed
command_exists mise || return

eval "$(mise activate zsh)"
