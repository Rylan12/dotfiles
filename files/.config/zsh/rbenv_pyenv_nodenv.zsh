# rbenv
if command_exists rbenv; then
  _evalcache rbenv init - zsh
fi

# pyenv
if command_exists pyenv; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  _evalcache pyenv init -
  _evalcache pyenv virtualenv-init -
fi

# nodenv
if command_exists nodenv; then
  _evalcache nodenv init -
fi
