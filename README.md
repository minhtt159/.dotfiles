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

# Stow targets ~/.config, so the two zsh files that must sit in $HOME are
# symlinked by hand. .zshenv carries the XDG_* exports and is read by every
# zsh, including the non-interactive ones that never source .zshrc.
ln -s ~/.dotfiles/zshrc/.zshrc ~/.zshrc
ln -s ~/.dotfiles/zshrc/.zshenv ~/.zshenv
```

## Structure

| Directory     | Tool               | Notes                                                                |
| ------------- | ------------------ | -------------------------------------------------------------------- |
| `ghostty/`    | Ghostty            | Terminal emulator — Catppuccin Mocha, launches tmux on start         |
| `tmux/`       | tmux               | Session manager — vim keys, catppuccin, tv-powered sessionizer       |
| `nvim/`       | Neovim             | Editor — LazyVim base, Catppuccin Mocha, Mason LSPs                  |
| `zshrc/`      | Zsh                | Shell — modular config, lazy loading, vim mode, uv/nvm auto-switch   |
| `sketchybar/` | SketchyBar         | macOS menu bar replacement                                           |
| `aerospace/`  | AeroSpace          | Tiling window manager                                                |
| `karabiner/`  | Karabiner-Elements | Keyboard remapping                                                   |
| `k9s/`        | k9s                | Kubernetes TUI                                                       |
| `btop/`       | btop               | System monitor                                                       |
| `wezterm/`    | WezTerm            | Alternate terminal (inactive)                                        |
| `zed/`        | Zed                | Alternate editor config                                              |
| `television/` | tv                 | Fuzzy finder config                                                  |
| `scripts/`    | Shell scripts      | `tmux-sessionizer`, `tmux-switch`, `open-terminal.zsh`, `dev-update` |
