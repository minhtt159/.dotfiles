# lazy/node.zsh - Node.js / NVM Lazy Loading
# Lazy load nvm; node/npm/npx already resolve via PATH

# Default node is put on PATH by ~/.zprofile (every login shell).

# ~~~~~~~~~~~~~~~~~~~~~~ NVM Initialization ~~~~~~~~~~~~~~~~~~~~~~
_init_nvm() {
  export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
  [[ ! -d "$NVM_DIR" ]] && mkdir -p "$NVM_DIR"

  local nvm_sh="$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
  if [[ ! -s "$nvm_sh" ]]; then
    echo "❌ nvm not found at $nvm_sh"
    return 1
  fi

  # Load nvm (skip nvm's own chpwd hook; we manage it ourselves)
  source "$nvm_sh" --no-use

  # Load nvm bash_completion (zsh-compatible)
  local nvm_completion="$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
  [[ -s "$nvm_completion" ]] && source "$nvm_completion"
}

# ~~~~~~~~~~~~~~~~~~~~~~ Auto Node Version Switching ~~~~~~~~~~~~~~~~~~~~~~
# Mirrors .nvmrc logic:
#   1. .nvmrc found (walks up) -> ensure nvm loaded, then nvm use
#   2. no .nvmrc               -> restore default bin on PATH

_nvm_auto_use() {
  local nvmrc=""
  local dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    if [[ -f "$dir/.nvmrc" ]]; then
      nvmrc="$dir/.nvmrc"
      break
    fi
    dir="${dir:h}"
  done

  if [[ -n "$nvmrc" ]]; then
    # Trigger lazy init if nvm isn't a real function yet
    if (( ! $+functions[nvm_version] )); then
      _init_nvm
    fi
    nvm use --silent 2>/dev/null || nvm use default --silent 2>/dev/null
  else
    # Only restore default if nvm is already loaded
    if (( $+functions[nvm_version] )); then
      nvm use default --silent 2>/dev/null
    fi
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd _nvm_auto_use

# ~~~~~~~~~~~~~~~~~~~~~~ Register Lazy Loaders ~~~~~~~~~~~~~~~~~~~~~~
lazy_load nvm _init_nvm
