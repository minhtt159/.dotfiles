# 07-aliases.zsh - Aliases and Functions
# Common aliases and utility functions

# ~~~~~~~~~~~~~~~~~~~~~~ Shell Aliases ~~~~~~~~~~~~~~~~~~~~~~
alias x="exit"
alias c="clear"
alias reload="source ~/.zshrc && echo '✅ Zsh configuration reloaded'"
alias zshconfig="$EDITOR ~/.zshrc"
alias zshdir="cd $ZSH_CONFIG_DIR && $EDITOR ."

# ~~~~~~~~~~~~~~~~~~~~~~ History Aliases ~~~~~~~~~~~~~~~~~~~~~~
alias hc="history -c"
alias hg="history | grep"
alias hs="history | grep -i"  # Case-insensitive history search

# History management for multi-tmux workflow
alias hshare="fc -RI"  # Force reload history from file
alias hsync="fc -W && fc -R"  # Write current session history and reload all

# ~~~~~~~~~~~~~~~~~~~~~~ File Listing (eza) ~~~~~~~~~~~~~~~~~~~~~~
if command -v eza &>/dev/null; then
  alias ls="eza --icons --git"
  alias ll="eza -la --icons --git"
  alias la="eza -la --icons --git"
  alias lt="eza --tree --level=2 --icons --git"
  alias lta="eza --tree --level=2 --icons --git -a"
else
  alias ll="ls -lah"
  alias la="ls -A"
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Editor Aliases ~~~~~~~~~~~~~~~~~~~~~~
alias v="$EDITOR"
alias vim="$EDITOR"
alias vi="$EDITOR"

# ~~~~~~~~~~~~~~~~~~~~~~ Git Aliases ~~~~~~~~~~~~~~~~~~~~~~
if command -v git &>/dev/null; then
  alias g="git"
  alias gs="git status"
  alias ga="git add"
  alias gaa="git add --all"
  alias gc="git commit"
  alias gcm="git commit -m"
  alias gp="git push"
  alias gpl="git pull"
  alias gl="git log --oneline --graph --decorate"
  alias gd="git diff"
  alias gco="git checkout"
  alias gb="git branch"
  alias gba="git branch -a"
  alias gbd="git branch -d"
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Lazygit ~~~~~~~~~~~~~~~~~~~~~~
if command -v lazygit &>/dev/null; then
  alias lg="lazygit"
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Kubernetes Debug Alias ~~~~~~~~~~~~~~~~~~~~~~
alias kdebug='kubectl run debug-pod --image=alpine --rm -it --restart=Never -- sh'

# ~~~~~~~~~~~~~~~~~~~~~~ tmux Aliases ~~~~~~~~~~~~~~~~~~~~~~
if command -v tmux &>/dev/null; then
  alias tm="tmux"
  alias tma="tmux attach"
  alias tml="tmux list-sessions"
  alias tmk="tmux kill-session"
fi

# ~~~~~~~~~~~~~~~~~~~~~~ System Utilities ~~~~~~~~~~~~~~~~~~~~~~
# Modern replacements
if command -v btop &>/dev/null; then
  alias top="btop"
fi

if command -v rg &>/dev/null; then
  alias grep="rg"
fi

if command -v fd &>/dev/null; then
  alias find="fd"
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Network Utilities ~~~~~~~~~~~~~~~~~~~~~~
alias myip="curl -s ifconfig.me"
alias localip="ipconfig getifaddr en0"
alias ports="lsof -i -P -n | grep LISTEN"

# ~~~~~~~~~~~~~~~~~~~~~~ Brewfile Management ~~~~~~~~~~~~~~~~~~~~~~
if [[ -f "$HOME/.dotfiles/Brewfile" ]]; then
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
    brew update || echo "⚠️  Homebrew update failed, continuing anyway..."
 
    # Install/update packages from Brewfile
    echo "🔄 Processing Brewfile..."
    brew bundle --file="$brewfile" || echo "⚠️  Some packages failed to install/update"
 
    # Clean up unused dependencies
    echo "🧹 Cleaning up unused packages..."
    brew bundle cleanup --file="$brewfile" --force --quiet
 
    # Update all formulas and casks (including greedy casks)
    echo "⬆️  Upgrading all packages..."
    brew upgrade --greedy || echo "⚠️  Some packages failed to upgrade"
 
    # Run maintenance tasks
    echo "🔧 Running maintenance..."
    brew cleanup --prune=7 --quiet
 
    # Check system health
    echo "🩺 Running health check..."
    brew doctor --quiet || echo "⚠️  Minor issues detected (check 'brew doctor' for details)"
 
    # Display summary
    echo "📊 Update summary:"
    echo "   Installed packages: $(brew list --formula | wc -l | tr -d ' ') formulas"
    echo "   Installed casks: $(brew list --cask | wc -l | tr -d ' ') casks"
 
    echo "✅ Brewup completed successfully!"
  }
  
  # Quick brew bundle install
  alias brewi="brew bundle --file=$HOME/.dotfiles/Brewfile"
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Directory Navigation ~~~~~~~~~~~~~~~~~~~~~~
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Quick access to common directories
alias dots="cd ~/.dotfiles"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dev="cd ~/Developer"

# ~~~~~~~~~~~~~~~~~~~~~~ Utility Functions ~~~~~~~~~~~~~~~~~~~~~~
# Create directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Extract various archive formats
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"     ;;
      *.tar.gz)    tar xzf "$1"     ;;
      *.bz2)       bunzip2 "$1"     ;;
      *.rar)       unrar x "$1"     ;;
      *.gz)        gunzip "$1"      ;;
      *.tar)       tar xf "$1"      ;;
      *.tbz2)      tar xjf "$1"     ;;
      *.tgz)       tar xzf "$1"     ;;
      *.zip)       unzip "$1"       ;;
      *.Z)         uncompress "$1"  ;;
      *.7z)        7z x "$1"        ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Get the weather
weather() {
  local location="${1:-}"
  curl -s "wttr.in/${location}"
}

# Quick note taking
note() {
  local note_file="$HOME/notes.txt"
  if [ $# -eq 0 ]; then
    $EDITOR "$note_file"
  else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $*" >> "$note_file"
    echo "✅ Note saved"
  fi
}
