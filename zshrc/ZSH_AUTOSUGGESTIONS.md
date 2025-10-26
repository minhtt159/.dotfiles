# ZSH Autosuggestions Integration

This document explains the zsh-autosuggestions integration implemented in the dotfiles for seamless multi-tmux session workflows.

## Key Features

### Enhanced History Sharing
- **100,000 history entries** per session
- **Immediate sharing** across all tmux sessions
- **Duplicate removal** for cleaner history
- **Smart filtering** of common commands

### Safe Key Bindings
All key bindings are chosen to avoid conflicts with tmux (Ctrl-B prefix) and neovim:

- `Ctrl+Y` - Accept suggestion
- `Alt+Right` - Accept suggestion (alternative)  
- `Alt+Left` - Clear suggestion
- `Ctrl+K` - Accept and execute
- `Ctrl+P/N` - History search up/down

### Multi-Tmux Aliases
- `hshare` - Force reload history from file
- `hsync` - Write and reload all history
- `hs` - Case-insensitive history search

## Configuration Files

- `zshrc/.zshrc` - Main configuration (Homebrew-based setup)
- `zshrc/zshrc_ubuntu` - Ubuntu configuration (oh-my-zsh based)

Both files include identical autosuggestions and history configurations for consistency.

## Usage Tips

1. **History sync between sessions**: Use `hshare` to see commands from other tmux sessions
2. **Manual sync**: Use `hsync` when you want your commands visible in other sessions immediately  
3. **Quick accept**: `Ctrl+Y` is the fastest way to accept suggestions
4. **Partial accept**: Use `Alt+Right` for word-by-word acceptance
5. **Clear unwanted**: `Alt+Left` clears suggestions that aren't helpful

## Performance Optimizations

- Async autosuggestions prevent blocking
- Completion caching reduces lookup time
- History buffer size limited to 20 chars for responsiveness
- Smart command filtering reduces noise in suggestions