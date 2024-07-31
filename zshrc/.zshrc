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

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  history-substring-search
  brew
  zsh-autosuggestions
  1password
  direnv
  # npm # Node.js
  # ng # Angular CLI
  # yarn
  # gradle # Java
)

alias x="exit"
alias reload="source ~/.zshrc"
alias hc="history -c"
alias hg="history | grep "

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
# export EDITOR='subl -w'

# Compilation flags
# export ARCHFLAGS="-arch arm64"

# Local bin
export PATH=$HOME/.local/bin:$PATH

# For a full list of active aliases, run `alias`.
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

#Include Z
if command -v brew >/dev/null 2>&1; then
  # Load rupa's z if installed
  [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

# -- Ruby
# if command -v rbenv >/dev/null 2>&1; then
#   eval "$(rbenv init - zsh)"
# fi

# -- Flutter
# if command -v flutter >/dev/null 2>&1; then
#   export PATH="$HOME/flutter/bin:$PATH"
# fi

# -- Rust
if command -v cargo >/dev/null 2>&1; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi
# -- Java
if command -v java >/dev/null 2>&1; then
  export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
fi
# -- Node Version Manager
# if [ -f /opt/homebrew/opt/nvm/nvm.sh ] ; then
#   export NVM_DIR="$HOME/.nvm"
#   [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# fi
#

# Flux
if command -v flux >/dev/null 2>&1; then
  eval "$(flux completion zsh)"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source <(kubectl completion zsh)
alias k=kubectl
compdef __start_kubectl k

# SOPS age for k3s
if command -v sops >/dev/null 2>&1; then
  export SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt
fi

autoload -U compinit; compinit

# Debug kubernetes - currently, direnv does not support aliases
alias kdebug='kubectl run bb --image=alpine --rm -it -- sh'
