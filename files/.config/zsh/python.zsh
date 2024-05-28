venv() {
  [[ -d venv ]] && echo "venv directory already exists" 1>&2 && return 1
  python3 -m venv venv && source venv/bin/activate
}
source-venv() {
  [[ ! -f venv/bin/activate ]] && echo "venv/bin/activate doesn't exist" 1>&2 && return 1
  source venv/bin/activate
}
venv-delete() {
  [[ -z "$VIRTUAL_ENV" ]] && echo "Not in a virtual environment" 1>&2 && return 1
  echo "Deleting $VIRTUAL_ENV"
  venv="$VIRTUAL_ENV"
  deactivate
  rm -rf "$venv"
}
