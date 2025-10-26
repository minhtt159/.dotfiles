# Optimized .zshrc - Modular Configuration
# Main entry point that sources all configuration modules
# Author: minhtt159
# Last Updated: 2025-10-26

# ~~~~~~~~~~~~~~~~~~~~~~ Performance Profiling ~~~~~~~~~~~~~~~~~~~~~~
# Uncomment to enable startup profiling:
# zmodload zsh/zprof

# ~~~~~~~~~~~~~~~~~~~~~~ Load Configuration Modules ~~~~~~~~~~~~~~~~~~~~~~
# Get the directory where .zshrc is located
ZSHRC_DIR="${${(%):-%x}:A:h}"
ZSH_CONFIG_DIR="${ZSHRC_DIR}/.zsh"

# Source all configuration files in order
config_files=(
  "$ZSH_CONFIG_DIR/00-init.zsh"
  "$ZSH_CONFIG_DIR/01-completion.zsh"
  "$ZSH_CONFIG_DIR/02-plugins.zsh"
  "$ZSH_CONFIG_DIR/03-options.zsh"
  "$ZSH_CONFIG_DIR/04-keybindings.zsh"
  "$ZSH_CONFIG_DIR/05-path.zsh"
  "$ZSH_CONFIG_DIR/06-lazy-load.zsh"
  "$ZSH_CONFIG_DIR/07-aliases.zsh"
  "$ZSH_CONFIG_DIR/08-prompt.zsh"
)

for config_file in $config_files; do
  if [[ -f "$config_file" ]]; then
    source "$config_file"
  else
    echo "Warning: Config file not found: $config_file"
  fi
done

unset config_files config_file

# ~~~~~~~~~~~~~~~~~~~~~~ Performance Profiling Output ~~~~~~~~~~~~~~~~~~~~~~
# Uncomment to show profiling results:
# zprof
