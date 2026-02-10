# Return if gt is not installed
command_exists gt || return

#compdef gt
###-begin-gt-completions-###
#
# yargs command completion script
#
# Installation: gt completion >> ~/.zshrc
#    or gt completion >> ~/.zprofile on OSX.
#
_gt_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" gt --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _gt_yargs_completions gt
###-end-gt-completions-###

# Count lines of code changed in current Graphite PR (vs parent branch)
if command_exists cloc; then
  gtcloc() {
    local current_branch parent_branch repo_root
    repo_root=$(git rev-parse --show-toplevel) || return 1
    current_branch=$(git branch --show-current)
    parent_branch=$(gt state | jq -r --arg b "$current_branch" '.[$b].parents[0].ref')

    if [[ -z "$parent_branch" || "$parent_branch" == "null" ]]; then
      echo "Error: Could not find parent branch for '$current_branch'" >&2
      return 1
    fi

    (cd "$repo_root" && cloc --git --diff "$parent_branch" HEAD)
  }
fi
