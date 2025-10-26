# 01-completion.zsh - Completion System Configuration
# Sets up and configures zsh's powerful completion system

# ~~~~~~~~~~~~~~~~~~~~~~ Initialize Completion System ~~~~~~~~~~~~~~~~~~~~~~
autoload -Uz compinit

# Check if compinit needs to be run (once per day for performance)
# This significantly speeds up shell startup
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Completion Caching ~~~~~~~~~~~~~~~~~~~~~~
# Create cache directory if it doesn't exist
ZSH_CACHE_DIR="${HOME}/.zsh/cache"
[[ ! -d "$ZSH_CACHE_DIR" ]] && mkdir -p "$ZSH_CACHE_DIR"

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$ZSH_CACHE_DIR"

# ~~~~~~~~~~~~~~~~~~~~~~ Completion Behavior ~~~~~~~~~~~~~~~~~~~~~~
# Enable menu selection for better UX
zstyle ':completion:*' menu select

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'

# Use LS_COLORS for file completion
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Completion strategies
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# ~~~~~~~~~~~~~~~~~~~~~~ Completion Styling ~~~~~~~~~~~~~~~~~~~~~~
# Group completions by category
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B%F{blue}→%f %d%b'
zstyle ':completion:*:messages' format '%F{yellow}→%f %d'
zstyle ':completion:*:warnings' format '%F{red}→%f No matches for: %d'
zstyle ':completion:*:corrections' format '%B%F{green}→%f %d (errors: %e)%b'

# ~~~~~~~~~~~~~~~~~~~~~~ Process Completion ~~~~~~~~~~~~~~~~~~~~~~
# Improved process listing for kill command
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

# ~~~~~~~~~~~~~~~~~~~~~~ Directory Completion ~~~~~~~~~~~~~~~~~~~~~~
# Don't complete directory names with trailing /
zstyle ':completion:*' squeeze-slashes true

# ~~~~~~~~~~~~~~~~~~~~~~ Homebrew Completions ~~~~~~~~~~~~~~~~~~~~~~
# Add Homebrew completions to fpath
if command -v brew &>/dev/null; then
  BREW_PREFIX="${HOMEBREW_PREFIX:-$(brew --prefix)}"
  fpath+=(
    "$BREW_PREFIX/share/zsh-completions"
    "$BREW_PREFIX/share/zsh/site-functions"
  )
fi
