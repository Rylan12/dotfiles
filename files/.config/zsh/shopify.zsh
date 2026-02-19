# Only load these on a Shopify machine
shopify_machine || return

# Load dev shell config
if [[ -f /opt/dev/dev.sh ]]; then
  source /opt/dev/dev.sh
fi

# Load tec shell config
if [[ -x "${HOME}/.local/state/tec/profiles/base/current/global/init" ]]; then
  eval "$("${HOME}/.local/state/tec/profiles/base/current/global/init" zsh)"
fi

# Usage: dev_tool_current_worktree cmd args...
dev_tool_current_worktree() {
  local world_trees_root="${HOME}/world/trees/"
  local stripped_cwd="${PWD##$world_trees_root}"

  local worktree
  if [[ "$stripped_cwd" = "$PWD" ]]; then
    worktree="root"
  else
    worktree="${stripped_cwd%%/*}"
  fi

  local tool="$1"
  shift

  if (( $# == 0 )); then
    echo "Running: ${HOME}/world/trees/$worktree/src/areas/tools/dev/bin/$tool"
  fi

  "${HOME}/world/trees/$worktree/src/areas/tools/dev/bin/$tool" $@
}

devl() {
  dev_tool_current_worktree "dev" $@
}

psstl() {
  dev_tool_current_worktree "user/psst" $@
}

# Source: https://vault.shopify.io/posts/338177
cheat() {
  curl -s https://proxy-shopify-ai.local.shop.dev/v1/chat/completions \
    -H "Content-Type: application/json" \
    -d "{
      \"model\": \"expensive-but-best\",
      \"messages\": [
        {\"role\": \"system\", \"content\": \"You are a concise cheat sheet. Provide ONLY the shortest possible answer - just the command, key combination, or flag needed. No explanations, no context, no formatting. Just the raw answer. Pay attention to proper case sensitivity (uppercase/lowercase).\"},
        {\"role\": \"user\", \"content\": \"$*\"}
      ]
    }" | jq -r '.choices[0].message.content'
}

alias b='tec build'
alias r='tec run --'

# Auto-set iTerm2 tab title from worldpath
_worldpath_tab_title() {
  local title="$(worldpath --spare)"
  if [[ -n "$_tab_suffix" ]]; then
    title="${title} - ${_tab_suffix}"
  fi
  echo -ne "\e]0;${title}\a"
}

# Override rename to append a suffix to worldpath instead
rename() {
  _tab_suffix="$*"
  _worldpath_tab_title
}

autoload -Uz add-zsh-hook
add-zsh-hook chpwd _worldpath_tab_title
