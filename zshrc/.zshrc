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

# Suppress direnv output
export DIRENV_LOG_FORMAT=""

# ~~~~~~~~~~~~~~~~~~~~~~ zsh configs ~~~~~~~~~~~~~~~~~~~~~~
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)
# ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

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
source "$HOME/.config/zsh-z/zsh-z.plugin.zsh"
autoload -Uz compinit
compinit

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

### FZF ###
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### Direnv ###
if type direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

# ASDF
if type asdf &> /dev/null; then
  # export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME=".config/asdf/.tool-versions"
  . $(brew --prefix asdf)/libexec/asdf.sh
  . ~/.asdf/plugins/golang/set-env.zsh
fi

# K9s
# export K9S_CONFIG_DIR=".config/k9s"

# Docker Desktop
if [ -d "/Applications/Docker.app" ]; then
  path+=("$HOME/.docker/bin")
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
  export SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ~~~~~~~~~~~~~~~~ Prompt & Completion ~~~~~~~~~~~~~~~~

zstyle ':completion:*' menu select

if type brew &>/dev/null; then
  fpath+=$(brew --prefix)/share/zsh-completions
  fpath+=$(brew --prefix)/share/zsh/site-functions
  autoload -Uz compinit promptinit
  compinit
  promptinit
fi

# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
# --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
# --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
# --color=selected-bg:#45475a \
# --multi"

# ~~~~~~~~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~
# For a full list of active aliases, run `alias`.
alias x="exit"
alias reload="source ~/.zshrc"
alias hc="history -c"
alias hg="history | grep "
alias zshconfig="nvim ~/.zshrc"
# alias ohmyzsh="nvim ~/.oh-my-zsh"
alias kdebug='kubectl run bb --image=alpine --rm -it -- sh'

# My custom Brew thingy
if [ -f ~/.dotfiles/Brewfile ]; then
  alias brewup="brew bundle --file=~/.dotfiles/Brewfile"
fi
