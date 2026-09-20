# Machine-wide Claude Code rules (symlinked to ~/.claude/CLAUDE.md via .dotfiles)

- Shell: the Bash tool runs **`/bin/zsh` as a login, non-interactive shell** (`$-` =
  `0569BEJNXghkl` — has `l`, no `i`). So `~/.zshenv` and `~/.zprofile` load, `~/.zshrc`
  does not. Exported environment belongs in `zshrc/.zshenv` (symlinked to `~/.zshenv`)
  so every shell gets it; `~/.config`-based CLIs like `tea`, `glab` and `op` depend on
  `XDG_CONFIG_HOME` being set there, or they read macOS's
  `~/Library/Application Support` and report themselves as logged out.
- Only wrap a command as `zsh -lic '<command>'` when it genuinely needs something
  `.zshrc` defines — an alias or a shell function (`brewup`, `dev-update`, the `tv*`
  aliases). Plain binaries and env vars do not need the wrapper.
