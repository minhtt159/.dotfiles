# 02-plugins.zsh - Plugin Loading
# Load zsh plugins from Homebrew and local sources

# ~~~~~~~~~~~~~~~~~~~~~~ Plugin Loader Function ~~~~~~~~~~~~~~~~~~~~~~
load_plugin() {
  local plugin_path="$1"
  if [[ -f "$plugin_path" ]]; then
    source "$plugin_path"
    return 0
  else
    return 1
  fi
}

# ~~~~~~~~~~~~~~~~~~~~~~ Zsh Autosuggestions ~~~~~~~~~~~~~~~~~~~~~~
if load_plugin "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"; then
  # Configuration
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#555555,bold"
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)
  ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
  ZSH_AUTOSUGGEST_USE_ASYNC=true
  ZSH_AUTOSUGGEST_MANUAL_REBIND=1

  # Ignore common commands for suggestions
  ZSH_AUTOSUGGEST_HISTORY_IGNORE="(ls|cd|pwd|exit|clear)"
fi

# ~~~~~~~~~~~~~~~~~~~~~~ Syntax Highlighting ~~~~~~~~~~~~~~~~~~~~~~
# Must be loaded after all other plugins
load_plugin "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# ~~~~~~~~~~~~~~~~~~~~~~ History Substring Search ~~~~~~~~~~~~~~~~~~~~~~
load_plugin "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh"

# ~~~~~~~~~~~~~~~~~~~~~~ Zsh-z (Directory Jumping) ~~~~~~~~~~~~~~~~~~~~~~
load_plugin "$XDG_CONFIG_HOME/zsh-z/zsh-z.plugin.zsh"

# ~~~~~~~~~~~~~~~~~~~~~~ Cleanup ~~~~~~~~~~~~~~~~~~~~~~
unfunction load_plugin
