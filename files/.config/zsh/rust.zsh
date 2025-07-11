# Return if bat is not installed
[[ ! -f "$HOME/.cargo/env" ]] && return

source "$HOME/.cargo/env"
