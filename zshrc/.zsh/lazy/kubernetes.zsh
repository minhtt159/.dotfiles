# lazy/kubernetes.zsh - Kubernetes Tools Lazy Loading
# Lazy load kubectl, helm, and k9s with completions

# ~~~~~~~~~~~~~~~~~~~~~~ kubectl Initialization ~~~~~~~~~~~~~~~~~~~~~~
_init_kubectl() {
  if ! command -v kubectl &>/dev/null; then
    echo "❌ kubectl not found in PATH"
    return 1
  fi

  # Load cached completion
  _cache_completion "kubectl" "kubectl completion zsh"

  # Common kubectl aliases
  alias k='kubectl'
  alias kgp='kubectl get pods'
  alias kgpa='kubectl get pods --all-namespaces'
  alias kgs='kubectl get services'
  alias kgd='kubectl get deployments'
  alias kgn='kubectl get nodes'
  alias kgns='kubectl get namespaces'
  alias kd='kubectl describe'
  alias kdel='kubectl delete'
  alias ka='kubectl apply -f'
  alias kaf='kubectl apply -f'
  alias kl='kubectl logs'
  alias klf='kubectl logs -f'
  alias kex='kubectl exec -it'
  alias kpf='kubectl port-forward'
  alias kctx='kubectl config current-context'
  alias kns='kubectl config set-context --current --namespace'

  # Set up completion for aliases
  compdef k=kubectl
  compdef kgp=kubectl
  compdef kgs=kubectl
  compdef kgd=kubectl
  compdef kd=kubectl
  compdef kdel=kubectl
  compdef ka=kubectl
  compdef kl=kubectl
  compdef kex=kubectl
}

# ~~~~~~~~~~~~~~~~~~~~~~ helm Initialization ~~~~~~~~~~~~~~~~~~~~~~
_init_helm() {
  if ! command -v helm &>/dev/null; then
    echo "❌ helm not found in PATH"
    return 1
  fi

  # Load cached completion
  _cache_completion "helm" "helm completion zsh"

  # Common helm aliases
  alias h='helm'
  alias hl='helm list'
  alias hi='helm install'
  alias hu='helm upgrade'
  alias hd='helm delete'
  alias hs='helm status'
  alias hr='helm repo'

  # Set up completion for aliases
  compdef h=helm
  compdef hl=helm
  compdef hi=helm
  compdef hu=helm
}

# ~~~~~~~~~~~~~~~~~~~~~~ k9s Initialization ~~~~~~~~~~~~~~~~~~~~~~
_init_k9s() {
  if ! command -v k9s &>/dev/null; then
    echo "❌ k9s not found in PATH"
    return 1
  fi

  # k9s doesn't provide shell completion, but we can set aliases
  alias k9='k9s'
}

# ~~~~~~~~~~~~~~~~~~~~~~ kubectx/kubens Initialization ~~~~~~~~~~~~~~~~~~~~~~
_init_kubectx() {
  if command -v kubectx &>/dev/null; then
    # kubectx completion usually comes with Homebrew
    local kubectx_comp="$HOMEBREW_PREFIX/share/zsh/site-functions/_kubectx"
    [[ -f "$kubectx_comp" ]] && source "$kubectx_comp"
  fi

  if command -v kubens &>/dev/null; then
    # kubens completion
    local kubens_comp="$HOMEBREW_PREFIX/share/zsh/site-functions/_kubens"
    [[ -f "$kubens_comp" ]] && source "$kubens_comp"
  fi
}

# ~~~~~~~~~~~~~~~~~~~~~~ Register Lazy Loaders ~~~~~~~~~~~~~~~~~~~~~~
lazy_load kubectl _init_kubectl
lazy_load helm _init_helm
lazy_load k9s _init_k9s
lazy_load kubectx _init_kubectx
lazy_load kubens _init_kubectx
