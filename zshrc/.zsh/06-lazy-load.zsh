# 06-lazy-load.zsh - Lazy Loading Framework
# Framework for lazy loading completions and tool initialization

# ~~~~~~~~~~~~~~~~~~~~~~ Lazy Loading Framework ~~~~~~~~~~~~~~~~~~~~~~
# Generic lazy loader function
# Usage: lazy_load <command> <init_function>
lazy_load() {
  local cmd=$1
  local init_func=$2

  eval "
    $cmd() {
      unfunction $cmd
      $init_func
      $cmd \"\$@\"
    }
  "
}

# ~~~~~~~~~~~~~~~~~~~~~~ Completion Caching ~~~~~~~~~~~~~~~~~~~~~~
# Cache completions to disk for faster subsequent loads
_cache_completion() {
  local tool_name="$1"
  local completion_cmd="$2"
  local cache_dir="$ZSH_CACHE_DIR/completions"
  local cache_file="$cache_dir/${tool_name}.zsh"

  # Create cache directory if it doesn't exist
  [[ ! -d "$cache_dir" ]] && mkdir -p "$cache_dir"

  # Generate completion cache if it doesn't exist
  if [[ ! -f "$cache_file" ]]; then
    eval "$completion_cmd" > "$cache_file" 2>/dev/null
  fi

  # Source cached completion
  [[ -f "$cache_file" ]] && source "$cache_file"
}

# ~~~~~~~~~~~~~~~~~~~~~~ Utility Functions ~~~~~~~~~~~~~~~~~~~~~~
# Clear all completion caches
clear_completion_cache() {
  local cache_dir="$ZSH_CACHE_DIR/completions"
  if [[ -d "$cache_dir" ]]; then
    rm -rf "$cache_dir"/*
    mkdir -p "$cache_dir"
    echo "✅ Completion cache cleared. Run 'reload' to rebuild."
  else
    echo "❌ No completion cache found."
  fi
}

# Clear cache for specific tool
clear_tool_cache() {
  local tool_name="$1"
  local cache_file="$ZSH_CACHE_DIR/completions/${tool_name}.zsh"

  if [[ -f "$cache_file" ]]; then
    rm "$cache_file"
    echo "✅ Cache cleared for $tool_name"
  else
    echo "❌ No cache found for $tool_name"
  fi
}

# ~~~~~~~~~~~~~~~~~~~~~~ Load Lazy Modules ~~~~~~~~~~~~~~~~~~~~~~
# Source lazy loading configurations for different tools
LAZY_DIR="${ZSH_CONFIG_DIR}/lazy"

if [[ -d "$LAZY_DIR" ]]; then
  for lazy_file in "$LAZY_DIR"/*.zsh(N); do
    source "$lazy_file"
  done
fi
