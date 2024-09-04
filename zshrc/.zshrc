# zmodload zsh/zprof
#NOTE: This breaks Lens
# If not in tmux, start tmux.
# if [[ -z ${TMUX+X}${ZSH_SCRIPT+X}${ZSH_EXECUTION_STRING+X} ]]; then
#   exec tmux
# fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8
# Compilation flags
# export ARCHFLAGS="-arch arm64"
# Suppress direnv output
export DIRENV_LOG_FORMAT=""

# ~~~~~~~~~~~~~~~~~~~~~~ p10k configs ~~~~~~~~~~~~~~~~~~~~~~
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# POWERLEVEL9K_MODE=ascii
# POWERLEVEL9K_DISABLE_HOT_RELOAD=true 
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(history)
POWERLEVEL9K_VCS_MAX_SYNC_LATENCY_SECONDS=0.003
# POWERLEVEL9K_INSTANT_PROMPT=quiet
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_DIR_BACKGROUND=0

# ~~~~~~~~~~~~~~~~~~~~~~ zsh configs ~~~~~~~~~~~~~~~~~~~~~~
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')
DISABLE_MAGIC_FUNCTIONS="true"

# Auto-update behavior
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7

# Other env_vars before load plugins
# -- ZSH builtin
NVM_HOMEBREW=$(brew --prefix nvm)
zstyle ':omz:plugins:nvm' lazy yes
zstyle ':omz:plugins:nvm' lazy-cmd prettier typescript nvim tmux
# -- EVALCACHE
export ZSH_EVALCACHE_DIR="$HOME/.local/.zsh-evalcache"

plugins=(
  1password
  z
  brew
  direnv # this might be slow
  dotenv
  git
  kubectl
  nvm
  #NOTE: these are custom plugins, remember to download it
  evalcache
)

# ~~~~~~~~~~~~~~~~~~~~~~ Oh-my-zsh ~~~~~~~~~~~~~~~~~~~~~~

source $ZSH/oh-my-zsh.sh

# ~~~~~~~~~~~~~~~~ Custom zsh plugins from Brew ~~~~~~~~~~~~~~~~

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

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
# Docker Desktop
if [ -d "/Applications/Docker.app" ]; then
  path+=("$HOME/.docker/bin")
fi

# -- Ruby
if type rbenv &>/dev/null; then
  # eval "$(rbenv init - zsh)"
  _evalcache rbenv init - zsh
fi

# -- Flutter
if type flutter &>/dev/null; then
  path+=("$HOME/flutter/bin")
fi

# -- Rust
if type cargo &>/dev/null; then
  path+=("$HOME/.cargo/bin")
fi

# -- Java
if type java &>/dev/null; then
  path+=("$(brew --prefix)/opt/openjdk/bin")
fi

# kubectl
if type kubectl &>/dev/null; then
  # eval "$(kubectl completion zsh)"
  _evalcache kubectl completion zsh
fi

# Flux
if type flux &>/dev/null; then
  # eval "$(flux completion zsh)"
  _evalcache flux completion zsh
fi

# SOPS age for k3s
if type sops &>/dev/null; then
  export SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ~~~~~~~~~~~~~~~~ Prompt & Completion ~~~~~~~~~~~~~~~~

if type brew &>/dev/null; then
  fpath+=$(brew --prefix)/share/zsh-completions
  fpath+=$(brew --prefix)/share/zsh/site-functions
  autoload -Uz compinit promptinit
  compinit
  promptinit
fi

zstyle ':completion:*' menu select

# ~~~~~~~~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~
# For a full list of active aliases, run `alias`.
alias x="exit"
alias reload="source ~/.zshrc"
alias hc="history -c"
alias hg="history | grep "
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias kdebug='kubectl run bb --image=alpine --rm -it -- sh'

# My custom Brew thingy
if [ -f ~/.dotfiles/Brewfile ]; then
  alias brewup="brew bundle --file=~/.dotfiles/Brewfile"
fi
