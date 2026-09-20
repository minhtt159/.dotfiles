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
