# FZF has a lot of customization, so this file is extracted.
# Much of the customization comes from the FZF documentation: https://github.com/junegunn/fzf

# zsh-vi-mode overwrites some key bindings, so let's source fzf after zsh-vi-mode is initialized.
# zsh-vi-mode will automatically call this function at the right time.
function zvm_after_init() {
  source <(fzf --zsh)
}

# Use fd because it's faster than find
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
_fzf_compgen_path() {
  fd --strip-cwd-prefix --hidden --follow --exclude ".git" "$1"
}
_fzf_compgen_dir() {
  fd --type d --strip-cwd-prefix --hidden --follow --exclude ".git" "$1"
}

# Show a border by default
export FZF_DEFAULT_OPTS='--border'
export FZF_COMPLETION_OPTS='--border --info=inline'

# Use tokyo night moon color scheme (from https://github.com/folke/tokyonight.nvim/blob/main/extras/fzf/tokyonight_moon.zsh)
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --color=fg:#c8d3f5,bg:#222436,hl:#ff966c \
  --color=fg+:#c8d3f5,bg+:#2f334d,hl+:#ff966c \
  --color=info:#82aaff,prompt:#86e1fc,pointer:#86e1fc \
  --color=marker:#c3e88d,spinner:#c3e88d,header:#c3e88d"

# CTRL-T to open file finder and show preview
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-R to search history, CTRL-Y to copy command to clipboard
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# ALT-C to change directories (show tree of directory as preview)
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"
