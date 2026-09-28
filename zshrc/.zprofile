# .zprofile - PATH for every login shell, interactive or not
# Symlink: ln -sf ~/.dotfiles/zshrc/.zprofile ~/.zprofile
#
# Runs after /etc/zprofile's path_helper (so prepends stick) and before .zshrc.
# Scripts, `zsh -lc` and Claude Code's Bash tool get these without .zshrc.

# Homebrew first, so the prepends below win over brew's node/python3
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# uv-managed Pythons (`uv python install --default`) and `uv tool` binaries
path=("$HOME/.local/bin" $path)

# nvm's default node, resolved without loading nvm. Brew also installs node as
# a dependency (bitwarden-cli, mongosh); this keeps nvm's ahead of it.
# lazy/node.zsh handles .nvmrc switching in interactive shells.
_nvm_bootstrap_path() {
  local nvm_dir="${NVM_DIR:-$HOME/.nvm}"
  local ref
  ref=$(<"$nvm_dir/alias/default") 2>/dev/null || return

  # Follow alias chain (max 3 hops: default -> lts/* -> lts/name -> vX.Y.Z)
  local i
  for i in 1 2 3; do
    [[ -f "$nvm_dir/alias/$ref" ]] || break
    ref=$(<"$nvm_dir/alias/$ref")
  done

  local node_bin="$nvm_dir/versions/node/$ref/bin"
  [[ -d "$node_bin" ]] && path=("$node_bin" $path)
}
_nvm_bootstrap_path
unfunction _nvm_bootstrap_path

# Language/tool bins, after the system dirs. Missing dirs are harmless.
path+=(
  "$GOBIN"                             # go install (gopls, golangci-lint, templ, …)
  "$HOMEBREW_PREFIX/opt/rustup/bin"    # rustup proxies: cargo, rustc (brew doesn't link them)
  "$HOME/.cargo/bin"                   # cargo install
  "$HOMEBREW_PREFIX/opt/libpq/bin"     # psql (keg-only)
  "$HOME/.docker/bin"                  # Docker Desktop CLI
)

typeset -U path
