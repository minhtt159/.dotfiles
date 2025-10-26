# lazy/terraform.zsh - Terraform/Terragrunt Lazy Loading
# Lazy load Terraform and Terragrunt with completions

# ~~~~~~~~~~~~~~~~~~~~~~ terraform Initialization ~~~~~~~~~~~~~~~~~~~~~~
_init_terraform() {
  if ! command -v terraform &>/dev/null; then
    echo "❌ terraform not found in PATH"
    return 1
  fi

  # Load cached completion
  _cache_completion "terraform" "terraform -install-autocomplete"

  # Common terraform aliases
  alias tf='terraform'
  alias tfi='terraform init'
  alias tfiu='terraform init -upgrade'
  alias tfp='terraform plan'
  alias tfa='terraform apply'
  alias tfaa='terraform apply -auto-approve'
  alias tfd='terraform destroy'
  alias tfda='terraform destroy -auto-approve'
  alias tfw='terraform workspace'
  alias tfwl='terraform workspace list'
  alias tfws='terraform workspace select'
  alias tfwn='terraform workspace new'
  alias tfo='terraform output'
  alias tfs='terraform show'
  alias tfv='terraform validate'
  alias tff='terraform fmt'
  alias tffr='terraform fmt -recursive'
  alias tfstate='terraform state'
  alias tfsl='terraform state list'
  alias tfss='terraform state show'
 
  # Set up completion for aliases
  compdef tf=terraform
  compdef tfi=terraform
  compdef tfp=terraform
  compdef tfa=terraform
  compdef tfo=terraform
}

# ~~~~~~~~~~~~~~~~~~~~~~ terragrunt Initialization ~~~~~~~~~~~~~~~~~~~~~~
_init_terragrunt() {
  if ! command -v terragrunt &>/dev/null; then
    echo "❌ terragrunt not found in PATH"
    return 1
  fi
 
  # Ensure terraform is initialized (terragrunt uses terraform completion)
  _init_terraform
 
  # Common terragrunt aliases
  alias tg='terragrunt'
  alias tgi='terragrunt init'
  alias tgiu='terragrunt init -upgrade'
  alias tgp='terragrunt plan'
  alias tga='terragrunt apply'
  alias tgaa='terragrunt apply -auto-approve'
  alias tgd='terragrunt destroy'
  alias tgda='terragrunt destroy -auto-approve'
  alias tgo='terragrunt output'
  alias tgv='terragrunt validate'
  alias tgf='terragrunt hclfmt'
  alias tgra='terragrunt run-all'
  alias tgrai='terragrunt run-all init'
  alias tgrap='terragrunt run-all plan'
  alias tgraa='terragrunt run-all apply'

  # Set up completion for aliases (using terraform completion)
  compdef tg=terraform
  compdef tgi=terraform
  compdef tgp=terraform
  compdef tga=terraform
  compdef tgo=terraform
}

# ~~~~~~~~~~~~~~~~~~~~~~ Register Lazy Loaders ~~~~~~~~~~~~~~~~~~~~~~
lazy_load terraform _init_terraform
lazy_load terragrunt _init_terragrunt
