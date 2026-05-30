# 08-prompt.zsh - Prompt Configuration
# Configure shell prompt with git information

# ~~~~~~~~~~~~~~~~~~~~~~ Simple Fast Prompt ~~~~~~~~~~~~~~~~~~~~~~
PROMPT='%(?.%F{14}⏺.%F{9}⏺)%f %2~ %# '

# ~~~~~~~~~~~~~~~~~~~~~~ Git Information (Right Prompt) ~~~~~~~~~~~~~~~~~~~~~~
autoload -Uz vcs_info
setopt prompt_subst

# Configure vcs_info for git
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '%b%u%c'
zstyle ':vcs_info:git*' actionformats '%F{14}⏱ %*%f'
zstyle ':vcs_info:git*' unstagedstr '*'
zstyle ':vcs_info:git*' stagedstr '+'

# Hook to run before each prompt
# Cache the du result per directory so it only runs once when you cd into a repo,
# not on every single prompt render.
_vcs_last_dir=""
_vcs_large_repo=0

_vcs_info_wrapper() {
  if [[ -d .git ]]; then
    if [[ "$PWD" != "$_vcs_last_dir" ]]; then
      _vcs_last_dir="$PWD"
      local git_dir_size
      git_dir_size=$(du -s .git 2>/dev/null | awk '{print $1}')
      _vcs_large_repo=$(( ${git_dir_size:-0} >= 10000 ))
    fi
    if (( _vcs_large_repo )); then
      zstyle ':vcs_info:*:*' check-for-changes false
    else
      zstyle ':vcs_info:*:*' check-for-changes true
    fi
  fi
  vcs_info
}

# Hook to run before each prompt
autoload -Uz add-zsh-hook
add-zsh-hook precmd _vcs_info_wrapper

# Right prompt with git info
RPROMPT='%F{8}⎇ $vcs_info_msg_0_%f'

# ~~~~~~~~~~~~~~~~~~~~~~ Optional: Enhanced Prompt ~~~~~~~~~~~~~~~~~~~~~~
# Uncomment to use a more detailed prompt with user, host, and time
# PROMPT='%F{cyan}%n@%m%f %F{yellow}%~%f %(?.%F{green}✓.%F{red}✗)%f %# '
# RPROMPT='%F{8}⎇ $vcs_info_msg_0_%f %F{242}%*%f'
