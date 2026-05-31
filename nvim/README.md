# Neovim Configuration

Built on [LazyVim](https://lazyvim.org) with a Catppuccin Mocha theme and minimal customization.

## Structure

```
nvim/
├── init.lua                  # Entry point (bootstraps lazy.nvim)
├── lazyvim.json              # LazyVim extras config
├── stylua.toml               # Lua formatter config
└── lua/
    ├── config/
    │   ├── autocmds.lua      # Auto commands
    │   ├── keymaps.lua       # Custom keymaps
    │   ├── lazy.lua          # lazy.nvim bootstrap
    │   └── options.lua       # Vim options
    └── plugins/
        ├── colorscheme.lua   # Catppuccin Mocha (transparent)
        ├── editor.lua        # gitsigns, trouble, todo-comments
        ├── experience.lua    # diffview
        ├── television.lua    # tv.nvim integration
        ├── treesitter.lua    # Treesitter overrides
        ├── ui.lua            # lualine, snacks picker
        ├── blink.lua         # Completion (blink.cmp)
        ├── sops.lua          # SOPS secret editing
        └── lang/
            ├── docker.lua    # dockerls, docker-compose-language-service
            ├── go.lua        # gopls, gofumpt, goimports, golangci-lint
            ├── terraform.lua # terraform-ls, tflint
            └── yaml.lua      # yamlls, gitlab-ci-ls
```

## Keymaps

Leader key: `<Space>`

### Navigation (via snacks picker)

| Key               | Action      |
| ----------------- | ----------- |
| `<leader><space>` | Find files  |
| `<leader>/`       | Grep (live) |
| `<leader>ff`      | Find files  |
| `<leader>fg`      | Live grep   |
| `<leader>fb`      | Buffers     |

### Television (tv.nvim)

| Key          | Action            |
| ------------ | ----------------- |
| `<leader>tv` | Channel selector  |
| `<leader>tf` | Files channel     |
| `<leader>tg` | Text/grep channel |
| `<leader>tB` | Git branches      |
| `<leader>tl` | Git log           |
| `<leader>td` | Git diff          |
| `<leader>tG` | Git repos         |
| `<leader>th` | Zsh history       |
| `<leader>te` | Env vars          |
| `<leader>tD` | LSP diagnostics   |

### Custom keymaps

| Key          | Mode   | Action                           |
| ------------ | ------ | -------------------------------- |
| `J` / `K`    | Visual | Move selected lines down/up      |
| `<Esc>`      | Normal | Clear search highlight           |
| `<leader>cd` | Normal | Show diagnostics float (LazyVim) |

Arrow keys in normal mode print a reminder to use hjkl.

## Mason LSP / Tool Registry

All managed by mason.nvim. Runtime dependencies:

| Tool                                                                                                                                                  | Runtime                          |
| ----------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------- |
| gopls, gofumpt, goimports, golangci-lint, gomodifytags, impl, templ                                                                                   | Go (compiled)                    |
| ruff, black                                                                                                                                           | Python (black uses mason venv)   |
| pyright, yaml-language-server, json-lsp, html-lsp, prettier, dockerfile-language-server, docker-compose-language-service, tailwindcss-language-server | **Node** (requires node on PATH) |
| lua-language-server                                                                                                                                   | Compiled (bash wrapper)          |
| stylua, htmx-lsp, gitlab-ci-ls                                                                                                                        | Rust (compiled)                  |
| shfmt, helm-ls, terraform-ls, tflint                                                                                                                  | Go (compiled)                    |

> Node LSPs use the default nvm node bootstrapped to PATH at shell init (see `zshrc/lazy/node.zsh`).
> Python LSPs (`pyright`, `ruff`) resolve the interpreter via `VIRTUAL_ENV` when a `.venv` is active.

## Theme

- **Colorscheme**: Catppuccin Mocha, fully transparent background (`#000000`)
- **Font**: JetBrainsMono Nerd Font (set in Ghostty)
- **Status line**: lualine with powerline-style separators
- **Picker**: snacks.nvim (includes hidden/gitignored files)
