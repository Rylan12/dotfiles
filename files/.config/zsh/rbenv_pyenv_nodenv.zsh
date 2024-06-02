# rbenv
_evalcache rbenv init - zsh

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
_evalcache pyenv init -
_evalcache pyenv virtualenv-init -

# nodenv
_evalcache nodenv init -
