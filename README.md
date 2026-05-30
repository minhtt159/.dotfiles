# dotfiles

Personal macOS dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Setup

```sh
# Install dependencies
brew bundle

# Symlink all configs to ~/.config
stow .

# Pull submodules (tmux plugins etc.)
git submodule update --init --recursive
```

## Structure

| Directory     | Tool                           | Notes                                                                |
| ------------- | ------------------------------ | -------------------------------------------------------------------- |
| `ghostty/`    | [Ghostty](https://ghostty.org) | Terminal emulator — Catppuccin Mocha, launches tmux on start         |
| `tmux/`       | tmux                           | Session manager — vim keys, catppuccin, tv-powered sessionizer       |
| `nvim/`       | Neovim                         | Editor — LazyVim base, Catppuccin Mocha, Mason LSPs                  |
| `zshrc/`      | Zsh                            | Shell — modular config, lazy loading, vim mode, uv/nvm auto-switch   |
| `sketchybar/` | SketchyBar                     | macOS menu bar replacement                                           |
| `aerospace/`  | AeroSpace                      | Tiling window manager                                                |
| `karabiner/`  | Karabiner-Elements             | Keyboard remapping                                                   |
| `k9s/`        | k9s                            | Kubernetes TUI                                                       |
| `btop/`       | btop                           | System monitor                                                       |
| `wezterm/`    | WezTerm                        | Alternate terminal (inactive)                                        |
| `zed/`        | Zed                            | Alternate editor config                                              |
| `television/` | tv                             | Fuzzy finder config                                                  |
| `scripts/`    | Shell scripts                  | `tmux-sessionizer`, `tmux-switch`, `open-terminal.zsh`, `dev-update` |
