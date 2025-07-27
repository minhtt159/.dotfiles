# Optimized .zshrc for improved startup time
# Enable profiling when needed: zmodload zsh/zprof

# ~~~~~~~~~~~~~~~~~~~~~~ Environment Setup ~~~~~~~~~~~~~~~~~~~~~~
# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Language and compilation
export LANG=en_US.UTF-8

# ~~~~~~~~~~~~~~~~~~~~~~ Homebrew Setup ~~~~~~~~~~~~~~~~~~~~~~
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Core Zsh Configuration ~~~~~~~~~~~~~~~~~~~~~~
# Enable completion system (call compinit only once)
autoload -Uz compinit

# Check if compinit needs to be run (once per day for performance)
for dump in ~/.zcompdump(N.mh+24); do
  compinit
  break
done
[[ -z "$dump" ]] && compinit -C

# Enhanced completion styling for better UX
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Ensure cache directory exists
[[ ! -d ~/.zsh/cache ]] && mkdir -p ~/.zsh/cache

# Group completions by category
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'

# Process completion improvements
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

# ~~~~~~~~~~~~~~~~~~~~~~ Plugin Loading (Conditional) ~~~~~~~~~~~~~~~~~~~~~~
# Function to load plugins if they exist
load_plugin() {
  [[ -f "$1" ]] && source "$1"
}

# Load zsh plugins
load_plugin "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
load_plugin "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
load_plugin "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
load_plugin "$XDG_CONFIG_HOME/zsh-z/zsh-z.plugin.zsh"

# ~~~~~~~~~~~~~~~~~~~~~~ Zsh-Autosuggestions Configuration ~~~~~~~~~~~~~~~~~~~~~~
# Configure autosuggestions for seamless history integration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#555555,bold"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# History-based suggestions prioritization
ZSH_AUTOSUGGEST_HISTORY_IGNORE="(ls|cd|pwd|exit|clear)"

# ~~~~~~~~~~~~~~~~~~~~~~ Completion Setup ~~~~~~~~~~~~~~~~~~~~~~
# Add homebrew completions if available
if command -v brew &>/dev/null; then
  fpath+="$HOMEBREW_PREFIX/share/zsh-completions"
  fpath+="$HOMEBREW_PREFIX/share/zsh/site-functions"
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Editor & Shell Configuration ~~~~~~~~~~~~~~~~~~~~~~
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# ~~~~~~~~~~~~~~~~~~~~~ History Configuration ~~~~~~~~~~~~~~~~~~~~~~
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# Enhanced history options for better autosuggestions
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# ~~~~~~~~~~~~~~~~~~~~~~ Key Bindings ~~~~~~~~~~~~~~~~~~~~~~
# Vi mode
set -o vi

# Key bindings for zsh-autosuggestions (tmux/neovim safe)
bindkey '^Y' autosuggest-accept              # Ctrl+Y: Accept suggestion
bindkey '^[[1;3C' autosuggest-accept         # Alt+Right: Accept suggestion
bindkey '^[[1;3D' autosuggest-clear          # Alt+Left: Clear suggestion
bindkey '^K' autosuggest-execute             # Ctrl+K: Accept and execute

# History substring search bindings (compatible with tmux)
bindkey '^P' history-substring-search-up     # Ctrl+P: Search up
bindkey '^N' history-substring-search-down   # Ctrl+N: Search down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Additional useful bindings
bindkey '^A' beginning-of-line               # Ctrl+A: Beginning of line
bindkey '^E' end-of-line                     # Ctrl+E: End of line
bindkey '^U' kill-whole-line                 # Ctrl+U: Kill whole line
bindkey '^W' backward-kill-word              # Ctrl+W: Kill word backward

# ~~~~~~~~~~~~~~~~~~~~~~ PATH Configuration ~~~~~~~~~~~~~~~~~~~~~~
# Go environment
if command -v go &>/dev/null; then
  export GOPATH="$HOME/go"
  export GOBIN="$GOPATH/bin"
  export GOROOT="$HOMEBREW_PREFIX/opt/go/libexec"
  path+=("$GOPATH/bin" "$GOROOT/bin")
fi

# PostgreSQL
if command -v psql &>/dev/null; then
  path+=("$HOMEBREW_PREFIX/opt/libpq/bin")
fi

# Rust
if command -v rustup &>/dev/null; then
  path+=("$HOMEBREW_PREFIX/opt/rustup/bin")
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Lazy Loading & Tool Configuration ~~~~~~~~~~~~~~~~~~~~~~
# Function to lazy load kubectl completion
_kubectl_completion() {
  if command -v kubectl &>/dev/null; then
    source <(kubectl completion zsh)
    compdef _kubectl kubectl
  fi
}

# Function to lazy load flux completion
_flux_completion() {
  if command -v flux &>/dev/null; then
    source <(flux completion zsh)
    compdef _flux flux
  fi
}

# Lazy load completions on first use
kubectl() {
  unfunction kubectl
  _kubectl_completion
  kubectl "$@"
}

flux() {
  unfunction flux
  _flux_completion
  flux "$@"
}

# Initialize direnv hook (this needs to be loaded early)
if command -v direnv &>/dev/null; then
  export DIRENV_LOG_FORMAT=""
  eval "$(direnv hook zsh)"
fi

# Docker Desktop
if [[ -d "/Applications/Docker.app" ]]; then
  path+=("$HOME/.docker/bin")
  fpath+="$HOME/.docker/completions"
fi

# SOPS age configuration
if command -v sops &>/dev/null; then
  export SOPS_AGE_KEY_FILE="$XDG_CONFIG_HOME/sops/age/keys.txt"
fi

# LM Studio
if [[ -d "$HOME/.lmstudio" ]]; then
  path+=("$HOME/.lmstudio/bin")
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~
alias x="exit"
alias reload="source ~/.zshrc"
alias hc="history -c"
alias hg="history | grep"
alias hs="history | grep -i"  # Case-insensitive history search
alias ls="eza -la --icons --git"
alias zshconfig="nvim ~/.zshrc"
alias kdebug='kubectl run bb --image=alpine --rm -it -- sh'
alias v="nvim"

# History management aliases for multi-tmux workflow
alias hshare="fc -RI"  # Force reload history from file
alias hsync="fc -W && fc -R"  # Write current session history and reload all

# Enhanced Brewfile management
if [[ -f ~/.dotfiles/Brewfile ]]; then
  brewup() {
    local brewfile="$HOME/.dotfiles/Brewfile"
    echo "🍺 Enhanced Homebrew update starting..."
 
    # Check if Homebrew is installed
    if ! command -v brew &>/dev/null; then
      echo "❌ Homebrew not installed. Please install it first."
      return 1
    fi
 
    # Update Homebrew itself
    echo "📦 Updating Homebrew..."
    if ! brew update; then
      echo "⚠️  Homebrew update failed, continuing anyway..."
    fi
 
    # Install/update packages from Brewfile
    echo "🔄 Processing Brewfile..."
    if ! brew bundle --file="$brewfile"; then
      echo "⚠️  Some packages failed to install/update"
    fi
 
    # Clean up unused dependencies
    echo "🧹 Cleaning up unused packages..."
    brew bundle cleanup --file="$brewfile" --force --quiet
 
    # Update all formulas and casks (including greedy casks)
    echo "⬆️  Upgrading all packages..."
    if ! brew upgrade --greedy; then
      echo "⚠️  Some packages failed to upgrade"
    fi
 
    # Run maintenance tasks
    echo "🔧 Running maintenance..."
    brew cleanup --prune=7 --quiet
 
    # Check system health (suppress minor warnings)
    echo "🩺 Running health check..."
    if ! brew doctor --quiet; then
      echo "⚠️  Minor issues detected (check 'brew doctor' for details)"
    fi
 
    # Display summary
    echo "📊 Update summary:"
    echo "   Installed packages: $(brew list --formula | wc -l | tr -d ' ') formulas"
    echo "   Installed casks: $(brew list --cask | wc -l | tr -d ' ') casks"
 
    echo "✅ Brewup completed successfully!"
  }
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Prompt Configuration ~~~~~~~~~~~~~~~~~~~~~~
# Simple, fast prompt
PROMPT='%(?.%F{14}⏺.%F{9}⏺)%f %2~ %# '

# Git information (optimized for performance)
autoload -Uz vcs_info
setopt prompt_subst

# Only check for changes in small repos (performance optimization)
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '%b%u%c'
zstyle ':vcs_info:git*' actionformats '%F{14}⏱ %*%f'
zstyle ':vcs_info:git*' unstagedstr '*'
zstyle ':vcs_info:git*' stagedstr '+'

# Enable change detection only for smaller repos
_vcs_info_wrapper() {
  if [[ -d .git ]]; then
    # Check repo size - skip change detection for large repos
    local git_dir_size=$(du -s .git 2>/dev/null | awk '{print $1}')
    if [[ ${git_dir_size:-0} -lt 10000 ]]; then
      zstyle ':vcs_info:*:*' check-for-changes true
    else
      zstyle ':vcs_info:*:*' check-for-changes false
    fi
  fi
  vcs_info
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd _vcs_info_wrapper

RPROMPT='%F{8}⎇ $vcs_info_msg_0_%f'
