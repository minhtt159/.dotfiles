# 04-keybindings.zsh - Key Bindings Configuration
# Configure keyboard shortcuts for shell interaction

# ~~~~~~~~~~~~~~~~~~~~~~ Vi Mode Configuration ~~~~~~~~~~~~~~~~~~~~~~
# Vi mode is set in 03-options.zsh (set -o vi)
# These bindings work in vi mode

# ~~~~~~~~~~~~~~~~~~~~~~ Line Movement ~~~~~~~~~~~~~~~~~~~~~~
bindkey '^A' beginning-of-line               # Ctrl+A: Beginning of line
bindkey '^E' end-of-line                     # Ctrl+E: End of line
bindkey '^B' backward-char                   # Ctrl+B: Move backward one char
bindkey '^F' forward-char                    # Ctrl+F: Move forward one char

# ~~~~~~~~~~~~~~~~~~~~~~ Line Editing ~~~~~~~~~~~~~~~~~~~~~~
bindkey '^U' kill-whole-line                 # Ctrl+U: Kill whole line
bindkey '^K' kill-line                       # Ctrl+K: Kill from cursor to end
bindkey '^W' backward-kill-word              # Ctrl+W: Kill word backward
bindkey '^Y' yank                            # Ctrl+Y: Paste (yank)

# ~~~~~~~~~~~~~~~~~~~~~~ History Navigation ~~~~~~~~~~~~~~~~~~~~~~
bindkey '^P' history-substring-search-up     # Ctrl+P: Search history up
bindkey '^N' history-substring-search-down   # Ctrl+N: Search history down
bindkey '^R' history-incremental-search-backward  # Ctrl+R: Reverse search

# Vi mode history navigation
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# ~~~~~~~~~~~~~~~~~~~~~~ Zsh Autosuggestions Bindings ~~~~~~~~~~~~~~~~~~~~~~
bindkey '^Y' autosuggest-accept              # Ctrl+Y: Accept suggestion (conflicts with yank, but more useful)
bindkey '^[[1;3C' autosuggest-accept         # Alt+Right: Accept suggestion
bindkey '^[[1;3D' autosuggest-clear          # Alt+Left: Clear suggestion
bindkey '^ ' autosuggest-execute             # Ctrl+Space: Accept and execute

# Alternative bindings for different terminal emulators
bindkey '^[[1;5C' forward-word               # Ctrl+Right: Move forward one word
bindkey '^[[1;5D' backward-word              # Ctrl+Left: Move backward one word

# ~~~~~~~~~~~~~~~~~~~~~~ Completion Navigation ~~~~~~~~~~~~~~~~~~~~~~
bindkey '^I' complete-word                   # Tab: Complete
bindkey '^[[Z' reverse-menu-complete         # Shift+Tab: Reverse complete

# ~~~~~~~~~~~~~~~~~~~~~~ Terminal-specific fixes ~~~~~~~~~~~~~~~~~~~~~~
# Fix backspace and delete in some terminals
bindkey '^?' backward-delete-char            # Backspace
bindkey '^[[3~' delete-char                  # Delete

# Fix Home and End keys
bindkey '^[[H' beginning-of-line             # Home
bindkey '^[[F' end-of-line                   # End
bindkey '^[[1~' beginning-of-line            # Home (alternative)
bindkey '^[[4~' end-of-line                  # End (alternative)
