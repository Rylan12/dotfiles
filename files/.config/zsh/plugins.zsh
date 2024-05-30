# Auto-suggestions
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Syntax highlighting (this should be sourced last)
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# git-extras completions
source "$HOMEBREW_PREFIX/opt/git-extras/share/git-extras/git-extras-completion.zsh"

# z
source "$HOMEBREW_PREFIX/etc/profile.d/z.sh"

# url-quote-magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# git-escpe-magic
autoload -Uz git-escape-magic
git-escape-magic
