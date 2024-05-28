# rbenv
eval "$(rbenv init - "$PROFILE_SHELL")"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# nodenv
eval "$(nodenv init -)"
