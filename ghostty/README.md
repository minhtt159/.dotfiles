# Ghostty Configuration

Ghostty is the terminal emulator. Config is split into multiple files for clarity.

Full reference: https://ghostty.dev/docs/config/reference

## Structure

```
ghostty/
├── config             # Main config (imports sub-configs, sets startup command)
├── colorscheme.conf   # Catppuccin Mocha palette + opacity
├── font.conf          # Font family, size, macOS options
└── window.conf        # Window padding, shell integration, mouse
```

## Startup

On launch, Ghostty runs `~/.config/scripts/open-terminal.zsh` which:

1. Bootstraps Homebrew PATH (non-interactive shell)
2. Attaches to existing `dotfiles` tmux session, or creates one in `~/.dotfiles`

## Theme

- **Colorscheme**: Catppuccin Mocha
- **Background**: `#000000` (pure black, opacity 0.97)
- **Font**: JetBrainsMono Nerd Font, size 16
- **Title bar**: Hidden (`macos-titlebar-style = hidden`)

## Notable Settings

| Setting                      | Value   | Reason                                                   |
| ---------------------------- | ------- | -------------------------------------------------------- |
| `background-opacity`         | 0.97    | Slight transparency without hurting readability          |
| `macos-option-as-alt`        | left    | Left Option key sends Alt sequences (for Alt+arrow etc.) |
| `mouse-hide-while-typing`    | true    | Cleaner typing experience                                |
| `shell-integration`          | detect  | Enables semantic zones, marks, title tracking            |
| `shell-integration-features` | ssh-env | Passes env through SSH sessions                          |
