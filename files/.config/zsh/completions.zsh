# Add custom completions to the FPATH
FPATH="${XDG_CONFIG_HOME:-$HOME/.config}/zsh/completions:$FPATH"

autoload -Uz compinit
compinit
