# lazy/talos.zsh - Talos Tools Lazy Loading
# Lazy load talosctl and omnictl with completions

# ~~~~~~~~~~~~~~~~~~~~~~ talosctl Initialization ~~~~~~~~~~~~~~~~~~~~~~
_init_talosctl() {
  if ! command -v talosctl &>/dev/null; then
    echo "❌ talosctl not found in PATH"
    return 1
  fi
 
  # Load cached completion
  _cache_completion "talosctl" "talosctl completion zsh"
 
  # Common talosctl aliases
  alias tc='talosctl'
  alias tcl='talosctl logs'
  alias tcd='talosctl dashboard'
  alias tcs='talosctl service'
  alias tcsl='talosctl service list'
  alias tcsr='talosctl service restart'
  alias tch='talosctl health'
  alias tcv='talosctl version'
  alias tcc='talosctl config'
  alias tcg='talosctl get'
  alias tcr='talosctl read'
 
  # Set up completion for aliases
  compdef tc=talosctl
  compdef tcl=talosctl
  compdef tcs=talosctl
}

# ~~~~~~~~~~~~~~~~~~~~~~ omnictl Initialization ~~~~~~~~~~~~~~~~~~~~~~
_init_omnictl() {
  if ! command -v omnictl &>/dev/null; then
    echo "❌ omnictl not found in PATH"
    return 1
  fi
 
  # Load cached completion
  _cache_completion "omnictl" "omnictl completion zsh"
 
  # Common omnictl aliases
  alias oc='omnictl'
  alias ocg='omnictl get'
  alias ocd='omnictl describe'
  alias ocl='omnictl logs'
 
  # Set up completion for aliases
  compdef oc=omnictl
  compdef ocg=omnictl
  compdef ocd=omnictl
}

# ~~~~~~~~~~~~~~~~~~~~~~ Register Lazy Loaders ~~~~~~~~~~~~~~~~~~~~~~
lazy_load talosctl _init_talosctl
lazy_load omnictl _init_omnictl
