bk() {
  if [[ "$#" -lt 1 ]]; then
    echo "Usage: $0 <file>..."
    return 1
  else
    for file in "$@"; do
      cp -R -- "$file" "$file.bk"
    done
  fi
}
mbk() {
  if [[ "$#" -lt 1 ]]; then
    echo "Usage: $0 <file>..."
    return 1
  else
    for file in "$@"; do
      mv -- "$file" "$file.bk"
    done
  fi
}
