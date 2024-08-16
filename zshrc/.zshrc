# zmodload zsh/zprof
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(history)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_DIR_BACKGROUND=0

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

# Auto-update behavior
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Other env_vars before load plugins
# -- ZSH-NVM
# export NVM_LAZY_LOAD=true
# export NVM_LAZY_LOAD_EXTRA_COMMANDS=('nvim','tmux')
# export NVM_COMPLETION=true
# -- ZSH builtin
NVM_HOMEBREW=$(brew --prefix nvm)
zstyle ':omz:plugins:nvm' lazy yes
zstyle ':omz:plugins:nvm' lazy-cmd prettier typescript nvim tmux
# -- EVALCACHE
export ZSH_EVALCACHE_DIR="$HOME/.local/.zsh-evalcache"

# Standard plugins can be found in $ZSH/plugins/
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

alias x="exit"
alias reload="source ~/.zshrc"
alias hc="history -c"
alias hg="history | grep "

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

source $ZSH/oh-my-zsh.sh

# User configuration

# -- ZSH Custom plugins installed from Brew
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch arm64"

# For a full list of active aliases, run `alias`.
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

# My custom Brew thingy
if [ -f ~/.dotfiles/Brewfile ]; then
  alias brewup="brew bundle --file=~/.dotfiles/Brewfile"
fi

# Suppress direnv output
export DIRENV_LOG_FORMAT=""

# -- Ruby
if command -v rbenv >/dev/null 2>&1; then
  # eval "$(rbenv init - zsh)"
  _evalcache rbenv init - zsh
fi

# -- Flutter
if command -v flutter >/dev/null 2>&1; then
  export PATH="$HOME/flutter/bin:$PATH"
fi

# -- Rust
if command -v cargo >/dev/null 2>&1; then
  path+=("$HOME/.cargo/bin")
fi

# -- Java
if command -v java >/dev/null 2>&1; then
  path+=("$(brew --prefix)/opt/openjdk/bin")
fi

# kubectl
if command -v kubectl >/dev/null 2>&1; then
  # eval "$(kubectl completion zsh)"
  _evalcache kubectl completion zsh
fi

# Flux
if command -v flux >/dev/null 2>&1; then
  # eval "$(flux completion zsh)"
  _evalcache flux completion zsh
fi

# SOPS age for k3s
if command -v sops >/dev/null 2>&1; then
  export SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ZSH completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi

# Debug kubernetes - currently, direnv does not support aliases
alias kdebug='kubectl run bb --image=alpine --rm -it -- sh'
