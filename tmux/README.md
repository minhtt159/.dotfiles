# Tmux Configuration

Catppuccin Mocha theme with vim-style bindings and television-powered session navigation.

## Key Bindings

Prefix: `Ctrl+B`

### Session & Window Management

| Key          | Action                                                         |
| ------------ | -------------------------------------------------------------- |
| `prefix + s` | Session switcher (tv picker)                                   |
| `prefix + S` | Native session tree (`x` to kill)                              |
| `prefix + f` | Sessionizer — jump to / create project session (tv dir picker) |
| `prefix + r` | Reload tmux config                                             |
| `prefix + ^` | Switch to last window                                          |

### Pane Navigation (vim-style)

| Key                | Action                         |
| ------------------ | ------------------------------ | -------------------- |
| `prefix + h/j/k/l` | Select pane left/down/up/right |
| `prefix + H/J/K/L` | Resize pane (10 cells)         |
| `prefix + x`       | Kill pane (no confirmation)    |
| `prefix + C-s`     | Toggle pane synchronization    |
| `prefix + =`       | Even horizontal layout         |
| `prefix + \|`      |                                | Even vertical layout |

### Copy Mode (vi)

| Key        | Action                    |
| ---------- | ------------------------- |
| `v`        | Begin selection           |
| `y`        | Copy selection and cancel |
| Mouse drag | Copy selection and cancel |

## Scripts

Located in `~/.config/scripts/` (symlinked from `~/.dotfiles/scripts/`):

| Script             | Description                                          |
| ------------------ | ---------------------------------------------------- |
| `tmux-sessionizer` | Fuzzy-find git repos with tv, create/switch sessions |
| `tmux-switch`      | List and switch tmux sessions with tv                |

## Theme

- **Plugin**: catppuccin/tmux (submodule at `plugins/catppuccin/`)
- **Flavor**: Mocha
- **Background**: `#000000` (matches Ghostty/Neovim)
- **Status bar**: top, shows application + session name
- **Status interval**: 15s

## Performance Settings

| Option              | Value | Reason                              |
| ------------------- | ----- | ----------------------------------- |
| `escape-time`       | 0     | Neovim compatibility (no Esc delay) |
| `history-limit`     | 50000 | Balanced memory vs scrollback       |
| `status-interval`   | 15    | Avoids excessive redraws            |
| `aggressive-resize` | on    | Fit tmux to smallest client         |
| `focus-events`      | on    | Neovim autoread / gitsigns updates  |
