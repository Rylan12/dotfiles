# Add custom executables to PATH
export PATH="$HOME/bin:$PATH"

# Use nvim regardless
alias vim='nvim'

# reload current directory
alias reload='[[ ! -d "$(pwd)" ]] && echo "$(pwd) no longer exists" && return 1 || cd "$(pwd)"'

# watch with colors
alias watch="watch -c"

# Pipe to clipboard
alias pb='pbcopy'

# Made file executable
alias cx='chmod +x'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Download youtube video as wav file
alias ytwav='yt-dlp --extract-audio --audio-format wav'

# Print out PATH
alias path='echo "$PATH" | tr ":" "\n"'
