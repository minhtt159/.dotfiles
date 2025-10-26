# lazy/cloud.zsh - Cloud CLI Tools Lazy Loading
# Lazy load AWS CLI, Azure CLI, and other cloud tools

# ~~~~~~~~~~~~~~~~~~~~~~ AWS CLI Initialization ~~~~~~~~~~~~~~~~~~~~~~
_init_aws() {
  if ! command -v aws &>/dev/null; then
    echo "❌ aws not found in PATH"
    return 1
  fi

  # AWS CLI completion
  local aws_completer="$HOMEBREW_PREFIX/bin/aws_completer"
  if [[ -f "$aws_completer" ]]; then
    complete -C "$aws_completer" aws
  fi

  # Common AWS aliases
  alias awsp='export AWS_PROFILE=$(aws configure list-profiles | fzf)'
  alias awsr='export AWS_REGION=$(aws ec2 describe-regions --query "Regions[].RegionName" --output text | tr "\t" "\n" | fzf)'
}

# ~~~~~~~~~~~~~~~~~~~~~~ Azure CLI Initialization ~~~~~~~~~~~~~~~~~~~~~~
_init_az() {
  if ! command -v az &>/dev/null; then
    echo "❌ az not found in PATH"
    return 1
  fi

  # Azure CLI completion (uses bash completion)
  local az_completion="$HOMEBREW_PREFIX/etc/bash_completion.d/az"
  if [[ -f "$az_completion" ]]; then
    autoload -U +X bashcompinit && bashcompinit
    source "$az_completion" 2>/dev/null
  fi

  # Common Azure aliases
  alias azl='az account list -o table'
  alias azs='az account set --subscription'
  alias azshow='az account show'
}

# ~~~~~~~~~~~~~~~~~~~~~~ Register Lazy Loaders ~~~~~~~~~~~~~~~~~~~~~~
lazy_load aws _init_aws
lazy_load az _init_az
