#!/bin/zsh -i

SESSION_NAME="dotfiles"
DOTFILES_DIR="${HOME}/.dotfiles"

# Ensure tmux is available
if ! command -v tmux >/dev/null 2>&1; then
  echo "tmux is not installed or not in PATH." >&2
  exit 1
fi

# Check if tmux server is running; if not, we can still create a session (tmux will start server)
# Check whether session exists
if tmux has-session -t "${SESSION_NAME}" 2>/dev/null; then
  echo "Attaching to existing tmux session: ${SESSION_NAME}"
  exec tmux attach-session -t "${SESSION_NAME}"
else
  # Create the session from the dotfiles directory and attach
  if [ ! -d "${DOTFILES_DIR}" ]; then
    echo "Directory ${DOTFILES_DIR} does not exist." >&2
    exit 2
  fi

  # Prefer tmux new-session -c (sets starting-directory) if supported
  if tmux -V >/dev/null 2>&1 && tmux new-session -h 2>&1 | grep -q -- '-c '; then
    echo "Creating and attaching to new tmux session '${SESSION_NAME}' in ${DOTFILES_DIR}"
    exec tmux new-session -s "${SESSION_NAME}" -c "${DOTFILES_DIR}"
  else
    # Fallback for older tmux: cd then create session
    echo "Creating and attaching to new tmux session '${SESSION_NAME}' (fallback) in ${DOTFILES_DIR}"
    cd "${DOTFILES_DIR}" || { echo "Failed to cd to ${DOTFILES_DIR}" >&2; exit 3; }
    exec tmux new-session -s "${SESSION_NAME}"
  fi
fi
