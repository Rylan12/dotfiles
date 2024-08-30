# Open a pre-saved vscode workspace
work() {
  WORKSPACE_DIR="$HOME/.vscode-workspaces/"
  [[ $# -eq 0 ]] && cd $WORKSPACE_DIR && return

  WORKSPACE_FILE="$WORKSPACE_DIR/$1"
  [[ -h "$WORKSPACE_FILE" ]] && code "$(cd -P "$WORKSPACE_FILE" && pwd)" && return

  WORKSPACE_FILE="$WORKSPACE_FILE.code-workspace"
  [[ ! -f "$WORKSPACE_FILE" ]] && echo "$1 workspace not found!" && return 1

  open "$WORKSPACE_FILE"
}
