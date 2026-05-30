# 04-keybindings.zsh - Key Bindings Configuration
# Vi mode is set in 03-options.zsh (set -o vi)
# Use vim motions for all line editing: 0/^ (start), $ (end), w/b/e/d/c etc.

# ~~~~~~~~~~~~~~~~~~~~~~ History Navigation ~~~~~~~~~~~~~~~~~~~~~~
bindkey '^P' history-substring-search-up     # Ctrl+P: Search history up
bindkey '^N' history-substring-search-down   # Ctrl+N: Search history down

# Vi mode history navigation
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey -M vicmd '/' history-incremental-search-backward

# ~~~~~~~~~~~~~~~~~~~~~~ Zsh Autosuggestions Bindings ~~~~~~~~~~~~~~~~~~~~~~
bindkey '^ ' autosuggest-accept              # Ctrl+Space: Accept suggestion
bindkey '^[[1;3C' autosuggest-accept         # Alt+Right: Accept suggestion
bindkey '^[[1;3D' autosuggest-clear          # Alt+Left: Clear suggestion

# ~~~~~~~~~~~~~~~~~~~~~~ Word Navigation ~~~~~~~~~~~~~~~~~~~~~~
bindkey '^[[1;5C' forward-word               # Ctrl+Right: Move forward one word
bindkey '^[[1;5D' backward-word              # Ctrl+Left: Move backward one word

# ~~~~~~~~~~~~~~~~~~~~~~ Completion Navigation ~~~~~~~~~~~~~~~~~~~~~~
bindkey '^I' complete-word                   # Tab: Complete
bindkey '^[[Z' reverse-menu-complete         # Shift+Tab: Reverse complete

# ~~~~~~~~~~~~~~~~~~~~~~ Terminal-specific fixes ~~~~~~~~~~~~~~~~~~~~~~
bindkey '^?' backward-delete-char            # Backspace
bindkey '^[[3~' delete-char                  # Delete
