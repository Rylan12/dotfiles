export CLICOLOR=1

# Pure prompt
autoload -U promptinit; promptinit
zstyle ':prompt:pure:prompt:success' color green
zstyle :prompt:pure:git:stash show yes
prompt pure

# Disable Pure's title-setting so we can manage it ourselves
prompt_pure_set_title() {}
