# Quickly view the contents of a file from a URL
view() {
  FILENAME="$(basename "$1")"
  curl --silent "$1" | bat --file-name "$FILENAME"
}
jview() {
  if [[ -z "$1" ]]; then
    jq . /dev/stdin | bat --language json
  else
    FILENAME="$(basename "$1")"
    if [[ -f "$1" ]]; then
      jq . "$1" | bat --language json --file-name "$FILENAME"
    else
    curl --silent "$1" | jq | bat --language json --file-name "$FILENAME"
    fi
  fi
}
jcat() {
  cat $1 | jq .
}
# View formula/cask metadata easily
fj() {
  jview "https://formulae.brew.sh/api/formula/${1}.json"
}
cj() {
  jview "https://formulae.brew.sh/api/cask/${1}.json"
}
