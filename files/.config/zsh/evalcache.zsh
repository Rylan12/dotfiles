# This must be loaded after homebrew to be able to have the HOMEBREW_PREFIX variable defined.
source "$HOMEBREW_PREFIX/share/evalcache/evalcache.plugin.zsh"

# Function to clear the cache and update the last flushed timestamp
evalcache-clear() {
  rm -f "$ZSH_EVALCACHE_DIR"/init-*.sh
  touch "$ZSH_EVALCACHE_DIR/.last_flushed"
}

# Clear the cache automatically if its been a day since the last flush or the file doesn't exist (but the directory does)
if [[ -f "$ZSH_EVALCACHE_DIR/.last_flushed" ]] && [[ -n "$(find "$ZSH_EVALCACHE_DIR/.last_flushed" -mtime +1)" ]]; then
  echo "evalcache: flushing cache because 24 hours have passed since the last flush"
  evalcache-clear
elif [[ ! -f "$ZSH_EVALCACHE_DIR/.last_flushed" ]] && [[ -d "$ZSH_EVALCACHE_DIR" ]]; then
  touch "$ZSH_EVALCACHE_DIR/.last_flushed"
fi
