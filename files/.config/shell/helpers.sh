#!/bin/bash
# Helpers specifically for use in all shell configuration

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

shopify_machine() {
  [[ -f "$HOME/.shopify_machine" ]]
}

personal_machine() {
  ! shopify_machine
}
