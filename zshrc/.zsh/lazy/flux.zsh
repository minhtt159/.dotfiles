# lazy/flux.zsh - Flux Lazy Loading
# Lazy load flux with completions

# ~~~~~~~~~~~~~~~~~~~~~~ flux Initialization ~~~~~~~~~~~~~~~~~~~~~~
_init_flux() {
  if ! command -v flux &>/dev/null; then
    echo "❌ flux not found in PATH"
    return 1
  fi
 
  # Load cached completion
  _cache_completion "flux" "flux completion zsh"
 
  # Common flux aliases
  alias fx='flux'
  alias fxg='flux get'
  alias fxr='flux reconcile'
  alias fxs='flux suspend'
  alias fxrs='flux resume'
  alias fxl='flux logs'
 
  # Set up completion for aliases
  compdef fx=flux
  compdef fxg=flux
  compdef fxr=flux
}

# ~~~~~~~~~~~~~~~~~~~~~~ Register Lazy Loaders ~~~~~~~~~~~~~~~~~~~~~~
lazy_load flux _init_flux
