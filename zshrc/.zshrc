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

# Completion styling
zstyle ':completion:*' menu select

# ~~~~~~~~~~~~~~~~~~~~~~ Plugin Loading (Conditional) ~~~~~~~~~~~~~~~~~~~~~~
# Only load plugins if they exist
if [[ -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if [[ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

if [[ -f "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ]]; then
  source "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
fi

# zsh-z plugin
if [[ -f "$XDG_CONFIG_HOME/zsh-z/zsh-z.plugin.zsh" ]]; then
  source "$XDG_CONFIG_HOME/zsh-z/zsh-z.plugin.zsh"
fi

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

# Vi mode
set -o vi

# ~~~~~~~~~~~~~~~~~~~~~ History ~~~~~~~~~~~~~~~~~~~~~~
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# ~~~~~~~~~~~~~~~~~~~~~~ PATH Configuration ~~~~~~~~~~~~~~~~~~~~~~
# Go environment
if command -v go &>/dev/null; then
  export GOPATH="$HOME/go"
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
alias ls="eza -la --icons --git"
alias zshconfig="nvim ~/.zshrc"
alias kdebug='kubectl run bb --image=alpine --rm -it -- sh'
alias v="nvim"

# Brewfile shortcut
if [[ -f ~/.dotfiles/Brewfile ]]; then
  alias brewup="brew bundle --file=~/.dotfiles/Brewfile"
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
