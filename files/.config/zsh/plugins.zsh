# Vi mode
source "$HOMEBREW_PREFIX/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh"

# Auto-pair
source "$HOMEBREW_PREFIX/share/zsh-autopair/autopair.zsh"

# git-extras completions
source "$HOMEBREW_PREFIX/opt/git-extras/share/git-extras/git-extras-completion.zsh"

# zoxide (z command)
_evalcache zoxide init zsh

# url-quote-magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# git-escpe-magic
autoload -Uz git-escape-magic
git-escape-magic

# Syntax highlighting (this should be sourced last, except for zsh-autosuggestions)
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Auto-suggestions (this should be sourced last)
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
