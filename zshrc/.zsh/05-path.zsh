# 05-path.zsh - PATH Configuration
# Configure PATH for various programming languages and tools

# ~~~~~~~~~~~~~~~~~~~~~~ Go Environment ~~~~~~~~~~~~~~~~~~~~~~
if command -v go &>/dev/null; then
  export GOPATH="${GOPATH:-$HOME/go}"
  export GOBIN="$GOPATH/bin"
  export GOROOT="$HOMEBREW_PREFIX/opt/go/libexec"
  path+=( "$GOPATH/bin" )
  path+=( "$GOROOT/bin" )
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Rust Environment ~~~~~~~~~~~~~~~~~~~~~~
if command -v rustup &>/dev/null; then
  path+=( "$HOMEBREW_PREFIX/opt/rustup/bin" )
  path+=( "$HOME/.cargo/bin" )
fi

# # ~~~~~~~~~~~~~~~~~~~~~~ Python Environment ~~~~~~~~~~~~~~~~~~~~~~
# if command -v python3 &>/dev/null; then
#   # Add Python user base binary directory
#   path=("$HOME/.local/bin" $path)
# fi
#
# # ~~~~~~~~~~~~~~~~~~~~~~ Node.js Environment ~~~~~~~~~~~~~~~~~~~~~~
# if command -v node &>/dev/null; then
#   # Add global npm packages
#   path=("$HOME/.npm-global/bin" $path)
# fi

# ~~~~~~~~~~~~~~~~~~~~~~ PostgreSQL ~~~~~~~~~~~~~~~~~~~~~~
if [[ -d "$HOMEBREW_PREFIX/opt/libpq/bin" ]]; then
  path+=("$HOMEBREW_PREFIX/opt/libpq/bin")
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Docker Desktop ~~~~~~~~~~~~~~~~~~~~~~
if [[ -d "/Applications/Docker.app" ]]; then
  path+="$HOME/.docker/bin"

  # Add Docker completions to fpath
  if [[ -d "$HOME/.docker/completions" ]]; then
    fpath+="$HOME/.docker/completions"
  fi
fi

# ~~~~~~~~~~~~~~~~~~~~~~ LM Studio ~~~~~~~~~~~~~~~~~~~~~~
if [[ -d "$HOME/.lmstudio" ]]; then
  path+="$HOME/.lmstudio/bin"
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Direnv Hook ~~~~~~~~~~~~~~~~~~~~~~
# Initialize direnv for per-directory environment variables
if command -v direnv &>/dev/null; then
  export DIRENV_LOG_FORMAT=""
  eval "$(direnv hook zsh)"
fi

# ~~~~~~~~~~~~~~~~~~~~~~ SOPS Configuration ~~~~~~~~~~~~~~~~~~~~~~
if command -v sops &>/dev/null; then
  export SOPS_AGE_KEY_FILE="$XDG_CONFIG_HOME/sops/age/keys.txt"
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Remove Duplicates from PATH ~~~~~~~~~~~~~~~~~~~~~~
typeset -U path
