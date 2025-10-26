# 03-options.zsh - Shell Options and History Configuration
# Configure zsh behavior and history management

# ~~~~~~~~~~~~~~~~~~~~~~ Shell Behavior Options ~~~~~~~~~~~~~~~~~~~~~~
# Vi mode for command line editing
set -o vi

# Change directory without cd command
setopt AUTO_CD

# Correct minor spelling errors
setopt CORRECT

# Don't beep on errors
setopt NO_BEEP

# Allow comments in interactive shell
setopt INTERACTIVE_COMMENTS

# ~~~~~~~~~~~~~~~~~~~~~~ History Configuration ~~~~~~~~~~~~~~~~~~~~~~
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

# ~~~~~~~~~~~~~~~~~~~~~~ History Options ~~~~~~~~~~~~~~~~~~~~~~
# Don't save commands that start with space
setopt HIST_IGNORE_SPACE

# Don't save duplicate commands consecutively
setopt HIST_IGNORE_DUPS

# Remove all duplicates from history
setopt HIST_IGNORE_ALL_DUPS

# Don't save duplicates when writing history
setopt HIST_SAVE_NO_DUPS

# Remove superfluous blanks from history
setopt HIST_REDUCE_BLANKS

# Show command with history expansion before running it
setopt HIST_VERIFY

# Share history between all sessions
setopt SHARE_HISTORY

# Append to history file instead of replacing
setopt APPEND_HISTORY

# Write to history file immediately
setopt INC_APPEND_HISTORY

# Don't save 'history' or 'fc' commands
setopt HIST_NO_STORE

# Remove function definitions from history
setopt HIST_NO_FUNCTIONS

# ~~~~~~~~~~~~~~~~~~~~~~ Globbing Options ~~~~~~~~~~~~~~~~~~~~~~
# Extended globbing for advanced pattern matching
setopt EXTENDED_GLOB

# Case-insensitive globbing
setopt NO_CASE_GLOB

# Sort filenames numerically when possible
setopt NUMERIC_GLOB_SORT

# ~~~~~~~~~~~~~~~~~~~~~~ Directory Stack Options ~~~~~~~~~~~~~~~~~~~~~~
# Push directories onto stack automatically
setopt AUTO_PUSHD

# Don't push duplicates
setopt PUSHD_IGNORE_DUPS

# Don't print directory stack after pushd/popd
setopt PUSHD_SILENT

# Swap meaning of + and - for pushd
setopt PUSHD_MINUS
