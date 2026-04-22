# Return if try is not installed
command_exists try || return

export TRY_PATH="${HOME}/Projects/tries"
eval "$(try init)"
