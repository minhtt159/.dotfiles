# lazy/python.zsh - Python / uv Lazy Loading
# Lazy load uv and python with completions

# ~~~~~~~~~~~~~~~~~~~~~~ uv Initialization ~~~~~~~~~~~~~~~~~~~~~~
_init_uv() {
  if ! command -v uv &>/dev/null; then
    echo "❌ uv not found in PATH"
    return 1
  fi

  # Cache shell completions
  _cache_completion "uv" "uv generate-shell-completion zsh"

  # Common aliases
  alias uvp="uv python"
  alias uvpi="uv python install"
  alias uvpl="uv python list"
  alias uvi="uv pip install"
  alias uvs="uv sync"
  alias uvr="uv run"
  alias uva="uv add"
}

_init_uvx() {
  if ! command -v uvx &>/dev/null; then
    echo "❌ uvx not found in PATH"
    return 1
  fi
  _cache_completion "uvx" "uvx --generate-shell-completion zsh"
}

# ~~~~~~~~~~~~~~~~~~~~~~ Auto Python Version Switching ~~~~~~~~~~~~~~~~~~~~~~
# Similar to nvm's .nvmrc logic:
#   1. .venv/ found (walks up)         -> activate it (LSPs pick this up automatically)
#   2. .python-version found (no venv) -> resolve via uv python find
#   3. neither                         -> deactivate / restore system python

_uv_auto_python() {
  local new_venv=""
  local new_pyver=""

  # Walk up from CWD to find .venv
  local dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    if [[ -f "$dir/.venv/bin/python" ]]; then
      new_venv="$dir/.venv"
      break
    fi
    dir="${dir:h}"
  done

  # If no .venv, look for .python-version (walk up)
  if [[ -z "$new_venv" ]]; then
    dir="$PWD"
    while [[ "$dir" != "/" ]]; do
      if [[ -f "$dir/.python-version" ]]; then
        new_pyver="$dir/.python-version"
        break
      fi
      dir="${dir:h}"
    done
  fi

  # --- Activate .venv ---
  if [[ -n "$new_venv" ]] && [[ "$new_venv" != "$VIRTUAL_ENV" ]]; then
    # Remove previous venv or uv-resolved python from PATH
    [[ -n "$VIRTUAL_ENV" ]] && path=("${path[@]:#$VIRTUAL_ENV/bin}")
    [[ -n "$_UV_PYTHON_BIN" ]] && { path=("${path[@]:#$_UV_PYTHON_BIN}"); unset _UV_PYTHON_BIN; }
    export VIRTUAL_ENV="$new_venv"
    path=("$new_venv/bin" $path)

  # --- Deactivate if we left a venv dir ---
  elif [[ -z "$new_venv" ]] && [[ -n "$VIRTUAL_ENV" ]]; then
    path=("${path[@]:#$VIRTUAL_ENV/bin}")
    unset VIRTUAL_ENV
  fi

  # --- .python-version without .venv ---
  if [[ -z "$VIRTUAL_ENV" ]] && [[ -n "$new_pyver" ]]; then
    local py_bin
    py_bin=$(uv python find 2>/dev/null)
    if [[ -n "$py_bin" ]]; then
      local py_bindir="${py_bin:h}"
      [[ -n "$_UV_PYTHON_BIN" ]] && path=("${path[@]:#$_UV_PYTHON_BIN}")
      export _UV_PYTHON_BIN="$py_bindir"
      path=("$py_bindir" $path)
    fi
  elif [[ -z "$VIRTUAL_ENV" ]] && [[ -z "$new_pyver" ]]; then
    # Clean up any uv-resolved python, fall back to system
    [[ -n "$_UV_PYTHON_BIN" ]] && { path=("${path[@]:#$_UV_PYTHON_BIN}"); unset _UV_PYTHON_BIN; }
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd _uv_auto_python
_uv_auto_python  # run once on shell init

# ~~~~~~~~~~~~~~~~~~~~~~ Register Lazy Loaders ~~~~~~~~~~~~~~~~~~~~~~
lazy_load uv _init_uv
lazy_load uvx _init_uvx
lazy_load python _init_uv
lazy_load python3 _init_uv
lazy_load pip _init_uv
lazy_load pip3 _init_uv
