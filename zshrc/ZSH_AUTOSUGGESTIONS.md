# ZSH Autosuggestions Integration

This document explains the zsh-autosuggestions integration in the dotfiles for seamless multi-tmux session workflows.

## Key Features

### Enhanced History Sharing

- **100,000 history entries** per session
- **Immediate sharing** across all tmux sessions
- **Duplicate removal** for cleaner history
- **Smart filtering** of common commands (`ls`, `cd`, `pwd`, `exit`, `clear`)

### Key Bindings

All bindings are chosen to avoid conflicts with tmux (Ctrl-B prefix) and neovim.
Line editing uses **vim mode** (`set -o vi` in `03-options.zsh`).

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+Space` | Insert | Accept autosuggestion |
| `Alt+Right` | Insert | Accept autosuggestion (alternative) |
| `Alt+Left` | Insert | Clear autosuggestion |
| `Ctrl+P` / `Ctrl+N` | Insert | History search up/down |
| `k` / `j` | Normal (vicmd) | History search up/down |
| `/` | Normal (vicmd) | Incremental history search backward |
| `Ctrl+Right` | Insert | Move forward one word |
| `Ctrl+Left` | Insert | Move backward one word |
| `Tab` / `Shift+Tab` | Insert | Complete / reverse complete |

In normal (vicmd) mode, all standard vim motions apply: `0`, `^`, `$`, `w`, `b`, `e`, `d`, `c`, etc.

### Multi-Tmux Aliases

- `hshare` — Force reload history from file (see commands from other sessions)
- `hsync` — Write current session history and reload all
- `hs` — Case-insensitive history search

## Configuration

Plugin config lives in `zshrc/.zsh/02-plugins.zsh`, key bindings in `zshrc/.zsh/04-keybindings.zsh`.

## Usage Tips

1. **History sync between sessions**: Use `hshare` to see commands from other tmux panes
2. **Manual sync**: Use `hsync` to make your commands visible in other sessions immediately
3. **Quick accept**: `Ctrl+Space` accepts the full suggestion
4. **Partial accept**: `Alt+Right` for word-by-word acceptance
5. **Clear unwanted**: `Alt+Left` clears suggestions that aren't helpful

## Performance Notes

- **Async mode** (`ZSH_AUTOSUGGEST_USE_ASYNC=true`) — suggestions never block the prompt
- **History-only strategy** — the completion engine is not invoked on every keypress
- **Buffer cap** at 20 chars — avoids slow lookups for long commands
- **Manual rebind** (`ZSH_AUTOSUGGEST_MANUAL_REBIND=1`) — prevents double-binding when `tv` rewrites keymaps after plugin load
