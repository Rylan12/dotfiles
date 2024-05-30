# These functions come from https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/macos

# Show/hide hidden files in the Finder
alias showfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Open in Finder the directories passed as arguments, or the current directory if
# no directories are passed
function ofd {
  if (( ! $# )); then
    open $PWD
  else
    open $@
  fi
}

function pfd() {
  osascript 2>/dev/null <<EOF
    tell application "Finder"
      return POSIX path of (insertion location as alias)
    end tell
EOF
}

function pfs() {
  osascript 2>/dev/null <<EOF
    set output to ""
    tell application "Finder" to set the_selection to selection
    set item_count to count the_selection
    repeat with item_index from 1 to count the_selection
      if item_index is less than item_count then set the_delimiter to "\n"
      if item_index is item_count then set the_delimiter to ""
      set output to output & ((item item_index of the_selection as alias)'s POSIX path) & the_delimiter
    end repeat
EOF
}

function cdf() {
  cd "$(pfd)"
}

function quick-look() {
  (( $# > 0 )) && qlmanage -p $* &>/dev/null &
}

function manp() {
  [[ $# -eq 0 ]] && >&2 echo "Usage: $0 command1 [command2 ...]" && return 1

  local page
  for page in "${(@f)"$(man -w $@)"}"; do
    command mandoc -Tpdf $page | open -f -a Preview
  done
}
compdef _man manp
