# Helpers specifically for use in zsh configuration

# Check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check if running on macOS
os_is_macos() {
  [[ "$(uname -s)" == "Darwin" ]]
}

# Check if running on Linux
os_is_linux() {
  [[ "$(uname -s)" == "Linux" ]]
}

personal_machine() {
  [[ -z "$SHOPIFY_MACHINE" ]]
}

shopify_machine() {
  [[ -n "$SHOPIFY_MACHINE" ]]
}
