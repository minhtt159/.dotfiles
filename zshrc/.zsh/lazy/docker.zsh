# lazy/docker.zsh - Docker Tools Lazy Loading
# Lazy load Docker and Docker Compose with completions

# ~~~~~~~~~~~~~~~~~~~~~~ docker Initialization ~~~~~~~~~~~~~~~~~~~~~~
_init_docker() {
  if ! command -v docker &>/dev/null; then
    echo "❌ docker not found in PATH"
    return 1
  fi

  # Docker completion is usually installed via Homebrew
  local docker_completion="$HOMEBREW_PREFIX/share/zsh/site-functions/_docker"
  if [[ -f "$docker_completion" ]]; then
    source "$docker_completion"
  fi

  # Common docker aliases
  alias d='docker'
  alias dc='docker compose'
  alias dps='docker ps'
  alias dpsa='docker ps -a'
  alias di='docker images'
  alias dex='docker exec -it'
  alias dl='docker logs'
  alias dlf='docker logs -f'
  alias drm='docker rm'
  alias drmi='docker rmi'
  alias dpr='docker system prune'
  alias dpra='docker system prune -a'
  alias dsp='docker system prune -a --volumes'
  alias dst='docker stats'
  alias din='docker inspect'

  # Docker Compose aliases
  alias dcu='docker compose up'
  alias dcud='docker compose up -d'
  alias dcd='docker compose down'
  alias dcl='docker compose logs'
  alias dclf='docker compose logs -f'
  alias dcp='docker compose ps'
  alias dcr='docker compose restart'
  alias dcb='docker compose build'
  alias dce='docker compose exec'

  # Set up completion for aliases
  compdef d=docker
  compdef dc='docker compose'
  compdef dps=docker
  compdef di=docker
  compdef dex=docker
  compdef dl=docker
}

# ~~~~~~~~~~~~~~~~~~~~~~ lazydocker Initialization ~~~~~~~~~~~~~~~~~~~~~~
_init_lazydocker() {
  if ! command -v lazydocker &>/dev/null; then
    echo "❌ lazydocker not found in PATH"
    return 1
  fi

  alias lzd='lazydocker'
}

# ~~~~~~~~~~~~~~~~~~~~~~ Register Lazy Loaders ~~~~~~~~~~~~~~~~~~~~~~
lazy_load docker _init_docker
lazy_load lazydocker _init_lazydocker
