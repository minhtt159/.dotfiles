# 00-init.zsh - Environment and Homebrew Setup
# Initialize core environment variables and Homebrew

# ~~~~~~~~~~~~~~~~~~~~~~ XDG Base Directory Specification ~~~~~~~~~~~~~~~~~~~~~~
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export ZSH_CACHE_DIR="${HOME}/.zsh/cache"
[[ ! -d "$ZSH_CACHE_DIR" ]] && mkdir -p "$ZSH_CACHE_DIR"

# ~~~~~~~~~~~~~~~~~~~~~~ Locale and Language ~~~~~~~~~~~~~~~~~~~~~~
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# ~~~~~~~~~~~~~~~~~~~~~~ Homebrew Setup ~~~~~~~~~~~~~~~~~~~~~~
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f "/usr/local/bin/brew" ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Editor Configuration ~~~~~~~~~~~~~~~~~~~~~~
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
  export VISUAL='vim'
else
  export EDITOR='nvim'
  export VISUAL='nvim'
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Eval Caching ~~~~~~~~~~~~~~~~~~~~~~
# Cache the output of expensive eval-based init commands (e.g. `tool init zsh`)
# Invalidates automatically when the tool version changes.
# Usage: _cache_eval <tool_name> <init_command>
_cache_eval() {
  local tool_name="$1"
  local init_cmd="$2"
  local cache_dir="$ZSH_CACHE_DIR/init"
  local cache_file="$cache_dir/${tool_name}.zsh"

  [[ ! -d "$cache_dir" ]] && mkdir -p "$cache_dir"

  # Rebuild only if the cache is missing or the tool binary is newer than it.
  # `-nt` follows the symlink to the real Cellar binary, whose mtime brew bumps
  # on upgrade — so this invalidates on upgrade without exec'ing `tool --version`
  # on every startup (~17ms saved per shell).
  local tool_bin
  tool_bin=$(command -v "$tool_name" 2>/dev/null)
  if [[ ! -f "$cache_file" || -z "$tool_bin" || "$tool_bin" -nt "$cache_file" ]]; then
    eval "$init_cmd" > "$cache_file" 2>/dev/null
    touch "$cache_file"
  fi

  [[ -f "$cache_file" ]] && source "$cache_file"
}
