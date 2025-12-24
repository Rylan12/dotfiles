# rbenv
if command_exists rbenv; then
  # TODO: source this directly and update in the background
  eval "$(rbenv init --no-rehash - zsh)"
fi

# nodenv
if command_exists nodenv; then
  # TODO: source this directly and update in the background
  eval "$(nodenv init --no-rehash -)"
fi
