# 05-path.zsh - Interactive-only tool setup
# PATH lives in ~/.zprofile and plain exports in ~/.zshenv, so scripts and
# Claude Code's Bash tool see the same tools as tmux/nvim.

# ~~~~~~~~~~~~~~~~~~~~~~ Docker Desktop ~~~~~~~~~~~~~~~~~~~~~~
if [[ -d "$HOME/.docker/completions" ]]; then
  fpath+="$HOME/.docker/completions"
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Direnv Hook ~~~~~~~~~~~~~~~~~~~~~~
if command -v direnv &>/dev/null; then
  export DIRENV_LOG_FORMAT=""
  _cache_eval "direnv" "direnv hook zsh"
fi
