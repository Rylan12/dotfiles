# Use `cursor` on a Shopify machine, and `code` otherwise.
local editor_cmd="code"
shopify_machine && editor_cmd="cursor"

# Return if editor is not installed
command_exists $editor_cmd || return

# Open a pre-saved vscode or cursor workspace
# Needs to be a shell function so that `cd` works properly
work() {
  WORKSPACE_DIR="$HOME/.workspaces/"
  [[ $# -eq 0 ]] && cd $WORKSPACE_DIR && return

  WORKSPACE_FILE="$WORKSPACE_DIR/$1"
  [[ -h "$WORKSPACE_FILE" ]] && $editor_cmd "$(cd -P "$WORKSPACE_FILE" && pwd)" && return

  WORKSPACE_FILE="$WORKSPACE_FILE.code-workspace"
  [[ ! -f "$WORKSPACE_FILE" ]] && echo "$1 workspace not found!" && return 1

  open "$WORKSPACE_FILE"
}
