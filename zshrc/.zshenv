# .zshenv - Environment for EVERY zsh, not just interactive ones
# Symlink: ln -s ~/.dotfiles/zshrc/.zshenv ~/.zshenv
#
# zsh reads .zshenv for all shells; .zshrc only for interactive ones. Tools that
# spawn a non-interactive zsh (Claude Code's Bash tool, `zsh -c`, scripts) never
# load .zshrc, so anything they need must live here. XDG_CONFIG_HOME is the one
# that bites: without it, `tea`, `glab` and `op` fall back to macOS's
# ~/Library/Application Support and report themselves as logged out.
#
# Keep this file to exported environment only - no PATH edits (macOS
# /etc/zprofile runs path_helper after this and would reorder them), no
# completions, no prompt, nothing interactive.

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# Language tooling data -> XDG (uv already follows XDG on its own)
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYTHON_HISTORY="$XDG_STATE_HOME/python/history"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export SOPS_AGE_KEY_FILE="$XDG_CONFIG_HOME/sops/age/keys.txt"
# export NVM_DIR="$XDG_DATA_HOME/nvm"   # only after: mv ~/.nvm "$XDG_DATA_HOME/nvm"
