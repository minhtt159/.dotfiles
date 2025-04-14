# zmodload zsh/zprof
#NOTE: This breaks Lens
# If not in tmux, start tmux.
# if [[ -z ${TMUX+X}${ZSH_SCRIPT+X}${ZSH_EXECUTION_STRING+X} ]]; then
#   exec tmux
# fi

# XDG collections
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Language
export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch arm64"

# ~~~~~~~~~~~~~~~~~~~~~~ zsh configs ~~~~~~~~~~~~~~~~~~~~~~
# Other env_vars before load plugins
# -- EVALCACHE
#export ZSH_EVALCACHE_DIR="$HOME/.local/.zsh-evalcache"

# plugins=(
#   1password
#   dotenv
#   git
# )

# ~~~~~~~~~~~~~~~~~~~~~~ Brew ~~~~~~~~~~~~~~~~~~~~~~

eval "$(/opt/homebrew/bin/brew shellenv)"

[ -f $HOME/.config/zsh-z/zsh-z.plugin.zsh ] && source "$HOME/.config/zsh-z/zsh-z.plugin.zsh"
autoload -Uz compinit
compinit

# ~~~~~~~~~~~~~~~~ ZSH plugins from Brew ~~~~~~~~~~~~~~~~

# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)
# ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# ~~~~~~~~~~~~~~~~ Prompt & Completion ~~~~~~~~~~~~~~~~

zstyle ':completion:*' menu select
#NOTE: https://github.com/zsh-users/zsh-completions#manual-installation
if type brew &>/dev/null; then
  fpath+=$(brew --prefix)/share/zsh-completions
  fpath+=$(brew --prefix)/share/zsh/site-functions
  autoload -Uz compinit promptinit
  compinit
  promptinit
fi

# ~~~~~~~~~~~~~~~~~~~~~~ EDITOR ~~~~~~~~~~~~~~~~~~~~~~
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
# Set to vi mode
set -o vi
alias v="nvim"

# ~~~~~~~~~~~~~~~~~~~~~ History ~~~~~~~~~~~~~~~~~~~~~~
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# ~~~~~~~~~~~~~~~~~~~~~~ PATH ~~~~~~~~~~~~~~~~~~~~~~~

### FZF ###
# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
# --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
# --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
# --color=selected-bg:#45475a \
# --multi"
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if type rustup &>/dev/null; then 
  path+=("$HOMEBREW_PREFIX/opt/rustup/bin")
fi

### Direnv ###
if type direnv &> /dev/null; then
  # Suppress direnv output
  export DIRENV_LOG_FORMAT=""
  eval "$(direnv hook zsh)"
fi

# K9s
# export K9S_CONFIG_DIR=".config/k9s"

# Docker Desktop
if [ -d "/Applications/Docker.app" ]; then
  path+=("$HOME/.docker/bin")
  fpath+=$HOME/.docker/completions
  autoload -Uz compinit
  compinit
fi

# kubectl
if type kubectl &>/dev/null; then
  eval "$(kubectl completion zsh)"
  #_evalcache kubectl completion zsh
fi

# Flux
if type flux &>/dev/null; then
  eval "$(flux completion zsh)"
  #_evalcache flux completion zsh
fi

# Elixir
# if type elixir &>/dev/null; then
#  eval "$(elixir --completion zsh)"
#  _evalcache elixir --completion zsh
#  fi

# SOPS age for k3s
if type sops &>/dev/null; then
  export SOPS_AGE_KEY_FILE="$XDG_CONFIG_HOME/sops/age/keys.txt"
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~
# For a full list of active aliases, run `alias`.
alias x="exit"
alias reload="source ~/.zshrc"
alias hc="history -c"
alias hg="history | grep "
alias ls="eza -la --icons --git"
alias zshconfig="nvim ~/.zshrc"
# alias ohmyzsh="nvim ~/.oh-my-zsh"
alias kdebug='kubectl run bb --image=alpine --rm -it -- sh'

# My custom Brew thingy
if [ -f ~/.dotfiles/Brewfile ]; then
  alias brewup="brew bundle --file=~/.dotfiles/Brewfile"
fi

PROMPT='%(?.%F{14}⏺.%F{9}⏺)%f %2~ %# '
# Autoload zsh's `add-zsh-hook` and `vcs_info` functions
# (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info

# Set prompt substitution so we can use the vcs_info_message variable
setopt prompt_subst

# Run the `vcs_info` hook to grab git info before displaying the prompt
add-zsh-hook precmd vcs_info

# Style the vcs_info message
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '%b%u%c'
# Format when the repo is in an action (merge, rebase, etc)
zstyle ':vcs_info:git*' actionformats '%F{14}⏱ %*%f'
zstyle ':vcs_info:git*' unstagedstr '*'
zstyle ':vcs_info:git*' stagedstr '+'
# This enables %u and %c (unstaged/staged changes) to work,
# but can be slow on large repos
zstyle ':vcs_info:*:*' check-for-changes true

# Set the right prompt to the vcs_info message
RPROMPT='%F{8}⎇ $vcs_info_msg_0_%f'

# Added by LM Studio CLI (lms)
if [ -d "$HOME/.lmstudio" ]; then
  export PATH="$PATH:$HOME/.lmstudio/bin"
fi
