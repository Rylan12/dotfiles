# Only load these on a Shopify machine
shopify_machine || return

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

eval "$(wcd --init zsh)"
