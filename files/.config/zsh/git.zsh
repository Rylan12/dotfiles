# Many of these come from https://github.com/ohmyzsh/ohmyzsh/tree/071b8f8921cb2bbb1fcabbf3d271e77af0b12a7d/plugins/git

# Get name of main branch
function git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,master}; do
    if command git show-ref -q --verify $ref; then
      echo ${ref:t}
      return 0
    fi
  done

  # If no main branch was found, fall back to master but return error
  echo master
  return 1
}

alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gbl='git blame -b -w'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcm='git checkout $(git_main_branch)'
alias gcam='git commit --all --message'
alias gc='git commit --verbose'
alias gc!='git commit --verbose --amend'
alias gca='git commit --verbose --all'
alias gca!='git commit --verbose --all --amend'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdup='git diff @{upstream}'
alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gfo='git fetch origin'
alias glo='git log --oneline --decorate'
alias glog='git log --oneline --decorate --graph'
alias gl='git pull'
alias gpr='git pull --rebase'
alias gp='git push'
alias gpf='git push --force-with-lease --force-if-includes'
alias grb='git rebase'
alias gr='git remote'
alias grv='git remote --verbose'
alias grh='git reset --hard'
alias grhh='git reset --hard HEAD'
alias groh='git reset origin/$(git_current_branch) --hard'
alias gst='git status'
