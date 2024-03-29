# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

alias files='fd --type f .'

# Change permission
alias cx='chmod +x'

# cd aliases
alias cd..='cd ..'
alias cdgr='cd "$(git root)"'

# git aliases
alias gdp='git diff --patience'
alias gdm='git dm'
alias grhhh='git reset --hard HEAD'

# ESP-IDF alias
alias get_idf='. $HOME/esp/esp-idf/export.sh'

# jq aliases
alias jqc='jq -C'

# cd shortcuts
alias des='cd ~/Desktop/'
alias dev='cd ~/Development/'
alias doc='cd ~/Documents/'
alias dow='cd ~/Downloads/'
alias hom='cd ~/Development/homebrew/'
alias cpsc='cd ~/Development/CPSC-323-Assignments/'
alias button='cd ~/Development/circles/'
work() {
    WORKSPACE_DIR=~/Development/vscode-workspaces/
    [[ $# -eq 0 ]] && cd $WORKSPACE_DIR && return
    
    WORKSPACE_FILE="$WORKSPACE_DIR/$1"
    [[ -h "$WORKSPACE_FILE" ]] && code "$WORKSPACE_FILE" && return

    WORKSPACE_FILE="$WORKSPACE_FILE.code-workspace"
    [[ ! -f "$WORKSPACE_FILE" ]] && echo "$1 workspace not found!" && return 1

    open "$WORKSPACE_FILE"
}
alias me390='cd "$HOME/Development/MENG-390L/"'
alias cs420='cd "$HOME/Development/CPSC-420/"'
alias cs520='cd "$HOME/Development/CPSC520/"'

# reload current directory
alias reload='[[ ! -d "$(pwd)" ]] && echo "$(pwd) no longer exists" && return 1 || cd "$(pwd)"'

# tmux
alias tkill='tmux kill-server'
alias tsave='tmux-save' # Mark session as non-killable (~/bin/tmux-save)

# diff-so-fancy
alias dsf='diff-so-fancy'

# lazygit alias
alias lg='lazygit'

# gh aliases
alias gh='PAGER= gh' # remove pager
alias prc='gh pr checkout'
alias prv='gh pr view'
alias prvw='gh pr view -w' # open PR in web browser
alias rpv='gh repo view'
alias rpvw='gh repo view -w' # open repo in web browser

# Pipe to clipboard
alias pb='pbcopy'

# eza aliases
alias e='eza'
alias ea='eza -a'
alias el='eza -l'
alias elh='eza -lh'
alias ela='eza -la'
alias elah='eza -lah'

# Homebrew aliases
alias brepo='cd /opt/homebrew'
alias bcore='cd /opt/homebrew/Library/Taps/homebrew/homebrew-core/'
alias bcask='cd /opt/homebrew/Library/Taps/homebrew/homebrew-cask/'
cdb() {
    cd "$(brew --repository $1)"
}
alias cdbl='cd $(brew --repository)/Library/Homebrew'
alias cellar='cd /opt/homebrew/Cellar/'
alias caskroom='cd /opt/homebrew/Caskroom/'
alias bcleanup='brew bundle cleanup'
alias baudit='brew audit --strict --online --git'

# GitKraken
alias kraken='git kraken'

# Download youtube video as wav file
alias ytwav='yt-dlp --extract-audio --audio-format wav'

# View contents of file
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

# View formula/cask metadata easily
fj() {
    jview "https://formulae.brew.sh/api/formula/${1}.json"
}
cj() {
    jview "https://formulae.brew.sh/api/cask/${1}.json"
}

# Extract tar from URL
extract() {
    curl "$1" | tar xf -
}

# Create and source virtual environment
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

# Automate poet for Homebrew resource blocks
poet-venv() {
    venv > /dev/null || return 1
    pip install homebrew-pypi-poet > /dev/null
    [[ -z "$1" ]] && echo "fail" 1>&2 && return
    pip install "$1" > /dev/null
    poet "$1" | tee /dev/tty | pbcopy
    venv-delete > /dev/null
}

# dotfiles
alias cddf='cd ~/.dotfiles'
alias dotfiles='git -C ~/.dotfiles'
alias dfs='git -C ~/.dotfiles status'
dfu() {
    (
        cd ~/.dotfiles && git pull --ff-only && ./install -q
    )
}

# Create a directory and cd into it
mcd() {
    mkdir "${1}" && cd "${1}"
}

# Backup file
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

# Execute a command in a specific directory
xin() {
    (
        cd "${1}" && shift && ${@}
    )
}

# watch colors
alias watch="watch -c"

# SHA-256 aliases
sha256url() {
    curl --silent "$1" | shasum -a 256 | awk '{print $1}'
}
