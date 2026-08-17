# Machine-wide Claude Code rules (symlinked to ~/.claude/CLAUDE.md via .dotfiles)

- Shell: this machine's login shell is **zsh**; the Bash tool runs plain `/bin/bash` (no
  profile). When a command needs my login config — `tea`, aliases, PATH from `.zshrc` — wrap it:
  `zsh -lic '<command>'`. Symptom of a missing profile: `_init_uv: command not found` noise or
  a CLI reporting "not logged in" despite valid config.
