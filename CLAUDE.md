# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal macOS dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/). Everything under a subdirectory is symlinked into `~/.config` (the `--target` in `.stowrc`).

## Setup

```sh
brew bundle           # Install all dependencies from Brewfile
stow .                # Symlink configs to ~/.config
git submodule update --init --recursive  # Pull tmux plugins etc.
```

## Key Commands

| Command                                | What it does                                              |
| -------------------------------------- | --------------------------------------------------------- |
| `stow .`                               | Re-apply symlinks after adding/renaming files             |
| `brewup`                               | Full Homebrew update: bundle → upgrade → cleanup → doctor |
| `brewi`                                | Quick `brew bundle` install only                          |
| `dev-update [python\|node\|rust\|all]` | Update language runtime managers (uv, nvm, rustup)        |
| `reload`                               | Re-source `~/.zshrc` in the current shell                 |
| `clear_completion_cache`               | Wipe cached zsh completions (rebuilds on next `reload`)   |

## Architecture

### Stow layout

Each top-level directory (`nvim/`, `tmux/`, `zshrc/`, etc.) maps directly to `~/.config/<dir>/` via stow. Files and directories listed in `.stowrc` (`Brew.*`, `defaults/`, `.DS_Store`, `*.md`) are excluded from symlinking.

### Zsh — `zshrc/`

`.zshrc` is a thin loader. Real config lives in numbered modules under `zshrc/.zsh/`:

- `00–05`: core init, completions, plugins, options, keybindings, PATH
- `06-lazy-load.zsh`: generic lazy-loader framework + sources all `lazy/*.zsh` files
- `07-aliases.zsh`: all aliases and shell functions
- `08–09`: prompt, compinit

Heavy tool initializations (kubectl, nvm, terraform, AWS, Flux, Talos) are deferred via the lazy-load framework in `zshrc/.zsh/lazy/` — each file wraps its tool so the init only runs on first invocation.

### Neovim — `nvim/`

Built on [LazyVim](https://www.lazyvim.org/) (`nvim/lua/config/lazy.lua`). Plugin layers:

- **LazyVim extras** declared inline in `lazy.lua` (copilot, blink, snacks, lang packs for Go/Helm/Python/Terraform/YAML/JSON, formatters)
- **Custom plugins** in `nvim/lua/plugins/` — override or extend LazyVim defaults
- **Language overrides** in `nvim/lua/plugins/lang/` — docker, go, terraform, yaml
- `stylua.toml` enforces Lua formatting (2-space indent, 120-col width)

### Television (`tv`) — the fuzzy finder glue

`tv` (the `television` binary) is the shared fuzzy-finder across the whole setup:

- **tmux**: `prefix+f` → `tmux-sessionizer` (picks project dir via `tv`); `prefix+s` → `tmux-switch` (picks session via `tv`)
- **nvim**: `tv.nvim` plugin with `<leader>t*` keybindings for files, text search, git branches/log/diff, history, env vars, diagnostics
- **zsh**: `tv*` aliases (`tvf`, `tvd`, `tvg`, `tvb`, `tvl`, `tvh`, `tve`, `tvk`)

### SketchyBar — `sketchybar/`

Written entirely in Lua via the `sketchybarrc` entry point. Widget code is in `items/widgets/`. The C event providers (`helpers/event_providers/`) expose CPU and network metrics; rebuild them with `make` inside that directory if the binaries go missing.

### Tmux — `tmux/`

Catppuccin Mocha theme. Plugins live as git submodules (check `.gitmodules`). Prefix is default (`C-b`). Vim-style pane navigation (`h/j/k/l`). Notable bindings: `prefix+f` sessionizer, `prefix+s` session switcher (tv-powered), `prefix+S` native tree chooser.
