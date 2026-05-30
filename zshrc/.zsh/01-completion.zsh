# 01-completion.zsh - Completion System Configuration
# Sets up and configures zsh's powerful completion system
# NOTE: compinit is intentionally deferred to 09-compinit.zsh so that all
# fpath additions (including Docker in 05-path.zsh) are registered first.

# ~~~~~~~~~~~~~~~~~~~~~~ Completion Caching ~~~~~~~~~~~~~~~~~~~~~~
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$ZSH_CACHE_DIR"

# ~~~~~~~~~~~~~~~~~~~~~~ Homebrew fpath ~~~~~~~~~~~~~~~~~~~~~~
# Add Homebrew completions to fpath before compinit runs
if [[ -n "$HOMEBREW_PREFIX" ]]; then
  fpath+=(
    "$HOMEBREW_PREFIX/share/zsh-completions"
    "$HOMEBREW_PREFIX/share/zsh/site-functions"
  )
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Completion Behavior ~~~~~~~~~~~~~~~~~~~~~~
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# ~~~~~~~~~~~~~~~~~~~~~~ Completion Styling ~~~~~~~~~~~~~~~~~~~~~~
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B%F{blue}→%f %d%b'
zstyle ':completion:*:messages' format '%F{yellow}→%f %d'
zstyle ':completion:*:warnings' format '%F{red}→%f No matches for: %d'
zstyle ':completion:*:corrections' format '%B%F{green}→%f %d (errors: %e)%b'

# ~~~~~~~~~~~~~~~~~~~~~~ Process Completion ~~~~~~~~~~~~~~~~~~~~~~
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

# ~~~~~~~~~~~~~~~~~~~~~~ Directory Completion ~~~~~~~~~~~~~~~~~~~~~~
zstyle ':completion:*' squeeze-slashes true
