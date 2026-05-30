# lazy/node.zsh - Node.js / NVM Lazy Loading
# Lazy load nvm, node, npm, and npx

# ~~~~~~~~~~~~~~~~~~~~~~ Bootstrap Default Node on PATH ~~~~~~~~~~~~~~~~~~~~~~
# Resolve nvm's default alias without loading nvm, so node is always available
# (needed for neovim LSPs like yaml-language-server, prettier, etc.)
_nvm_bootstrap_path() {
  local nvm_dir="${NVM_DIR:-$HOME/.nvm}"
  [[ ! -d "$nvm_dir/versions/node" ]] && return

  # Resolve default -> lts/* -> lts/name -> version
  local alias_file="$nvm_dir/alias/default"
  [[ ! -f "$alias_file" ]] && return

  local ref version
  ref=$(cat "$alias_file")

  # Follow alias chain (max 3 hops: default -> lts/* -> lts/name -> vX.Y.Z)
  local i=0
  while [[ $i -lt 3 ]]; do
    local alias_path="$nvm_dir/alias/$ref"
    if [[ -f "$alias_path" ]]; then
      ref=$(cat "$alias_path")
      (( i++ ))
    else
      break
    fi
  done

  version="$ref"
  local node_bin="$nvm_dir/versions/node/$version/bin"
  [[ -d "$node_bin" ]] && path=("$node_bin" $path) && export _NVM_DEFAULT_BIN="$node_bin"
}
_nvm_bootstrap_path

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
    if ! type nvm 2>/dev/null | grep -q "nvm_version"; then
      _init_nvm
    fi
    nvm use --silent 2>/dev/null || nvm use default --silent 2>/dev/null
  else
    # Only restore default if nvm is already loaded
    if type nvm 2>/dev/null | grep -q "nvm_version"; then
      nvm use default --silent 2>/dev/null
    fi
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd _nvm_auto_use

# ~~~~~~~~~~~~~~~~~~~~~~ Register Lazy Loaders ~~~~~~~~~~~~~~~~~~~~~~
lazy_load nvm _init_nvm
lazy_load npm _init_nvm
lazy_load npx _init_nvm
