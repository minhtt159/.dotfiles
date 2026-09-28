#!/bin/zsh -l
# Login shell (-l) so ~/.zprofile sets PATH; the tmux server and every
# run-shell binding inherit it.

SESSION_NAME="dotfiles"
DOTFILES_DIR="${HOME}/.dotfiles"

if tmux has-session -t "${SESSION_NAME}" 2>/dev/null; then
  exec tmux attach-session -t "${SESSION_NAME}"
else
  exec tmux new-session -s "${SESSION_NAME}" -c "${DOTFILES_DIR}"
fi
