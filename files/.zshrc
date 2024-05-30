# Loaded for all zsh interactive shells

# The configuration is divided modularly into various *.zsh files in ~/.config/zsh.
# Modules listed in the FIRST array will be loaded first (in order).
# Modules listed in the LAST array will be loaded last (in order).
# All remaining modules will be loaded in alphabetical order in between.

first=(homebrew completions)
last=(appearance plugins)

# Find remaining modules

ZSHDIR="$XDG_CONFIG_HOME/zsh"

# Add the `.zsh` extension to the FIRST and LAST arrays
first_files=(${first[@]/%/.zsh})
last_files=(${last[@]/%/.zsh})

# Create an array of all files to exclude
excluded_files=("${first_files[@]}" "${last_files[@]}")

# Create a grep pattern to exclude files
# For example, if ignoring foo.zsh and bar.zsh, the pattern will be "^(foo.zsh|bar.zsh)$"
exclude_pattern=$(printf "|%s" "${excluded_files[@]}")
exclude_pattern=${exclude_pattern:1}
exclude_pattern="^($(echo "$exclude_pattern" | sed 's/ /|/g'))$" # In case we didn't explain something correctly, all whitespace becomes a |

# Find remaining files (only the base names) and split by newlines into a list
remaining_files=$(find "$ZSHDIR" -type f -name "*.zsh" | xargs -n 1 basename | grep -vE "$exclude_pattern")
remaining_files=(${=remaining_files})

# Combine lists in order and load the files
files=("${first_files[@]}" "${remaining_files[@]}" "${last_files[@]}")
for file in $files; do
  source "$ZSHDIR/$file"
done
