# Use extended globbing
setopt extended_glob

# Add custom executables to PATH
export PATH="$HOME/.local/bin:$PATH"

# Use nvim regardless (if it's installed)
if command_exists nvim; then
  alias vim='nvim'
fi

# Highlight the matching text in grep
alias grep='grep --color=auto'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS}'

# reload current directory
alias reload='[[ ! -d "$(pwd)" ]] && echo "$(pwd) no longer exists" && return 1 || cd "$(pwd)"'

# watch with colors
alias watch="watch -c"

# Pipe to clipboard
if command_exists pbcopy; then
  alias -g P="| pbcopy"
  alias pb='pbcopy'
fi

# Made file executable
alias cx='chmod +x'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Make and cd into a directory
mcd() {
  mkdir "$1" && cd "$1"
}

# Global aliases
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g B="| bat"
alias -g J="| jq -C | less"
alias -g ST='&& echo TRUE || echo FALSE'
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g HOME="$HOME"
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# Download youtube video as wav file
if command_exists yt-dlp; then
  alias ytwav='yt-dlp --extract-audio --audio-format wav'
fi

# Lazygit shortcut
if command_exists lazygit; then
  alias lg='lazygit'
fi

# Print out PATH
alias path='echo "$PATH" | tr ":" "\n"'

# Open zsh configuration in editor
alias zshconfig="$EDITOR $ZSHDIR"

# Edit secrets file
alias secrets="$EDITOR $ZSHDIR/secrets.zsh"

# Reload configuration
alias src="source $HOME/.zshrc"
