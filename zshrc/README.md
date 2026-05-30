# Zsh Configuration - Modular Structure

This directory contains modular zsh configuration files for better organization and maintainability.

## Structure

```
.zsh/
├── README.md                 # This file
├── 00-init.zsh              # Environment setup and Homebrew
├── 01-completion.zsh        # Completion zstyles and fpath setup
├── 02-plugins.zsh           # Plugin loading
├── 03-options.zsh           # Shell options and history
├── 04-keybindings.zsh       # Key bindings
├── 05-path.zsh              # PATH configuration
├── 06-lazy-load.zsh         # Lazy loading framework + eval cache
├── 07-aliases.zsh           # Aliases and utility functions
├── 08-prompt.zsh            # Prompt configuration
├── 09-compinit.zsh          # Deferred compinit (must run last)
└── lazy/                    # Lazy-loaded tool configurations
    ├── kubernetes.zsh       # kubectl, helm, k9s
    ├── docker.zsh           # docker, lazydocker
    ├── cloud.zsh            # aws, az
    ├── terraform.zsh        # terraform, terragrunt
    ├── talos.zsh            # talosctl, omnictl, flux
    ├── node.zsh             # nvm, node, npm, npx (+ .nvmrc auto-switch)
    └── python.zsh           # uv, uvx, python, pip (+ .venv/.python-version auto-switch)
```

## Loading Order

Files are loaded in numerical order (00-09), ensuring proper dependency management:

1. **00-init.zsh** - Sets up environment variables and Homebrew
2. **01-completion.zsh** - Configures completion zstyles and adds Homebrew to fpath
3. **02-plugins.zsh** - Loads zsh plugins (autosuggestions, syntax highlighting, tv)
4. **03-options.zsh** - Configures shell behavior and history
5. **04-keybindings.zsh** - Sets up keyboard shortcuts
6. **05-path.zsh** - Configures PATH for various tools (also adds Docker to fpath)
7. **06-lazy-load.zsh** - Sets up lazy loading framework and loads lazy modules
8. **07-aliases.zsh** - Defines aliases and utility functions
9. **08-prompt.zsh** - Configures the shell prompt
10. **09-compinit.zsh** - Runs `compinit` last, after all fpath additions are complete

## Lazy Loading

Tools in the `lazy/` directory are loaded on-demand:

- **kubernetes.zsh** - kubectl, helm, k9s, kubectx
- **docker.zsh** - docker, docker compose, lazydocker
- **cloud.zsh** - AWS CLI, Azure CLI
- **terraform.zsh** - terraform, terragrunt
- **talos.zsh** - talosctl, omnictl
- **flux.zsh** - flux
- **node.zsh** - nvm, node, npm, npx. Bootstraps default node to PATH at init (no nvm load needed) so neovim Node LSPs always work. Auto-switches via `.nvmrc` on `cd`.
- **python.zsh** - uv, uvx, python, pip. Auto-activates `.venv/` and respects `.python-version` via `chpwd` hook so pyright/ruff always see the right interpreter.

### Benefits

- **Faster startup**: Tools only initialize when first used
- **Cached completions**: Completions generated once and cached to disk
- **Cached evals**: `direnv` and `tv` init output cached by version (see `_cache_eval` in `06-lazy-load.zsh`)
- **Automatic aliases**: Useful shortcuts created on first use
- **Easy maintenance**: Each tool's configuration is isolated

### Usage

```bash
# First use initializes the tool (slight delay)
kubectl get pods

# Subsequent uses are instant (uses cached completion)
kubectl get services

# Clear all completion caches
clear_completion_cache

# Clear specific tool cache
clear_tool_cache kubectl
```

## Customization

### Adding a New Lazy-Loaded Tool

1. Create a new file in `.zsh/lazy/` (e.g., `mytool.zsh`)
2. Define an initialization function:

```zsh
_init_mytool() {
  if ! command -v mytool &>/dev/null; then
    echo "❌ mytool not found in PATH"
    return 1
  fi

  # Load cached completion
  _cache_completion "mytool" "mytool completion zsh"

  # Add aliases
  alias mt='mytool'
  compdef mt=mytool
}

# Register lazy loader
lazy_load mytool _init_mytool
```

3. The tool will automatically be lazy-loaded on first use

### Modifying Aliases

Edit `.zsh/07-aliases.zsh` to add or modify aliases.

### Changing Prompt

Edit `.zsh/08-prompt.zsh` to customize your prompt appearance.

## Performance

Expected startup times with current optimizations:

- **Cold start (first run / compinit rebuild)**: ~200ms
- **Warm start (compinit cached)**: ~50-100ms
- **Tool initialization (first use)**: ~100-300ms
- **Tool usage (cached)**: 0-10ms

Key optimizations in place:

- `compinit` deferred to `09-compinit.zsh` — runs after all fpath additions, cached for 24h
- `tv init` and `direnv hook` outputs cached via `_cache_eval` (invalidated on version change)
- All heavy tools (kubectl, helm, nvm, docker, etc.) lazy-loaded on first use
- `vcs_info` `du` check cached per directory, not per prompt render

## Debugging

To profile startup time:

```bash
# Uncomment in .zshrc (already scaffolded):
# zmodload zsh/zprof   ← top of .zshrc
# zprof                ← bottom of .zshrc

# Then reload shell
exec zsh
```

To clear all caches and force a fresh rebuild:

```bash
# Clear completion cache (forces compinit rebuild next start)
clear_completion_cache

# Clear a specific tool's eval cache (e.g. tv, direnv)
rm ~/.zsh/cache/init/tv.zsh

# Clear specific completion cache
clear_tool_cache kubectl
```

## Migration from Single .zshrc

Your existing `.zshrc` has been split into these modular files. All functionality is preserved:

- ✅ Plugins loaded
- ✅ Completions configured
- ✅ Aliases available
- ✅ Lazy loading implemented
- ✅ Performance optimized

Simply reload your shell to use the new configuration:

```bash
source ~/.zshrc
```
