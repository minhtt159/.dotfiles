# 09-compinit.zsh - Deferred Completion Initialization
# Must be sourced LAST so all fpath additions (Homebrew, Docker, etc.) are
# registered before compinit builds the completion dump.

autoload -Uz compinit

# Use the dump file in the cache dir to avoid cluttering $HOME
_zcompdump="${ZSH_CACHE_DIR}/.zcompdump"

# Regenerate dump at most once per day; use -C (skip security check) otherwise
if [[ -n ${_zcompdump}(#qN.mh+24) ]]; then
  compinit -d "$_zcompdump"
else
  compinit -C -d "$_zcompdump"
fi

unset _zcompdump

# ~~~~~~~~~~~~~~~~~~~~~~ Television (tv) Shell Integration ~~~~~~~~~~~~~~~~~~~~~~
# Loaded here (after compinit) because tv init output uses compdef
if command -v tv &>/dev/null; then
  _cache_eval "tv" "tv init zsh"
fi
