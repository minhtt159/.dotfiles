#!/bin/zsh

# Bootstrap Homebrew PATH (non-interactive shell doesn't load zshrc)
[[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

SESSION_NAME="dotfiles"
DOTFILES_DIR="${HOME}/.dotfiles"

if tmux has-session -t "${SESSION_NAME}" 2>/dev/null; then
  exec tmux attach-session -t "${SESSION_NAME}"
else
  exec tmux new-session -s "${SESSION_NAME}" -c "${DOTFILES_DIR}"
fi
