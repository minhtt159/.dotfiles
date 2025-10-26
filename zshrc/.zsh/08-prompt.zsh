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

# Optimize for performance - only check changes in small repos
_vcs_info_wrapper() {
  if [[ -d .git ]]; then
    # Check repo size - skip change detection for large repos (>10MB)
    local git_dir_size=$(du -s .git 2>/dev/null | awk '{print $1}')
    if [[ ${git_dir_size:-0} -lt 10000 ]]; then
      zstyle ':vcs_info:*:*' check-for-changes true
    else
      zstyle ':vcs_info:*:*' check-for-changes false
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
