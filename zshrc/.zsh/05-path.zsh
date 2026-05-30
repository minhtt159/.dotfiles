# 05-path.zsh - PATH Configuration
# Configure PATH for various programming languages and tools

# ~~~~~~~~~~~~~~~~~~~~~~ Go Environment ~~~~~~~~~~~~~~~~~~~~~~
if command -v go &>/dev/null; then
  export GOPATH="${GOPATH:-$HOME/go}"
  export GOBIN="$GOPATH/bin"
  path+=( "$GOPATH/bin" )
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Rust Environment ~~~~~~~~~~~~~~~~~~~~~~
if command -v rustup &>/dev/null; then
  path+=( "$HOMEBREW_PREFIX/opt/rustup/bin" )
  path+=( "$HOME/.cargo/bin" )
fi

# ~~~~~~~~~~~~~~~~~~~~~~ PostgreSQL ~~~~~~~~~~~~~~~~~~~~~~
if [[ -d "$HOMEBREW_PREFIX/opt/libpq/bin" ]]; then
  path+=("$HOMEBREW_PREFIX/opt/libpq/bin")
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Docker Desktop ~~~~~~~~~~~~~~~~~~~~~~
if [[ -d "/Applications/Docker.app" ]]; then
  path+="$HOME/.docker/bin"

  if [[ -d "$HOME/.docker/completions" ]]; then
    fpath+="$HOME/.docker/completions"
  fi
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Direnv Hook ~~~~~~~~~~~~~~~~~~~~~~
if command -v direnv &>/dev/null; then
  export DIRENV_LOG_FORMAT=""
  _cache_eval "direnv" "direnv hook zsh"
fi

# ~~~~~~~~~~~~~~~~~~~~~~ SOPS Configuration ~~~~~~~~~~~~~~~~~~~~~~
if command -v sops &>/dev/null; then
  export SOPS_AGE_KEY_FILE="$XDG_CONFIG_HOME/sops/age/keys.txt"
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Remove Duplicates from PATH ~~~~~~~~~~~~~~~~~~~~~~
typeset -U path
