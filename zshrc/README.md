# Zsh Configuration - Modular Structure

This directory contains modular zsh configuration files for better organization and maintainability.

## Structure

```
.zsh/
├── README.md                 # This file
├── 00-init.zsh              # Environment setup and Homebrew
├── 01-completion.zsh        # Completion system configuration
├── 02-plugins.zsh           # Plugin loading
├── 03-options.zsh           # Shell options and history
├── 04-keybindings.zsh       # Key bindings
├── 05-path.zsh              # PATH configuration
├── 06-lazy-load.zsh         # Lazy loading framework
├── 07-aliases.zsh           # Aliases and utility functions
├── 08-prompt.zsh            # Prompt configuration
└── lazy/                    # Lazy-loaded tool configurations
    ├── kubernetes.zsh       # kubectl, helm, k9s
    ├── docker.zsh           # docker, lazydocker
    ├── cloud.zsh            # aws, az
    ├── terraform.zsh        # terraform, terragrunt
    └── talos.zsh           # talosctl, omnictl, flux
```

## Loading Order

Files are loaded in numerical order (00-08), ensuring proper dependency management:

1. **00-init.zsh** - Sets up environment variables and Homebrew
2. **01-completion.zsh** - Initializes the completion system
3. **02-plugins.zsh** - Loads zsh plugins
4. **03-options.zsh** - Configures shell behavior and history
5. **04-keybindings.zsh** - Sets up keyboard shortcuts
6. **05-path.zsh** - Configures PATH for various tools
7. **06-lazy-load.zsh** - Sets up lazy loading framework and loads lazy modules
8. **07-aliases.zsh** - Defines aliases and utility functions
9. **08-prompt.zsh** - Configures the shell prompt

## Lazy Loading

Tools in the `lazy/` directory are loaded on-demand:

- **kubernetes.zsh** - kubectl, helm, k9s, kubectx
- **docker.zsh** - docker, docker compose, lazydocker
- **cloud.zsh** - AWS CLI, Azure CLI
- **terraform.zsh** - terraform, terragrunt
- **talos.zsh** - talosctl, omnictl
- **flux.zsh** - flux

### Benefits

- **Faster startup**: Tools only initialize when first used
- **Cached completions**: Completions are generated once and cached
- **Automatic aliases**: Useful shortcuts are created automatically
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

Expected startup times:

- **Before modularization**: 500-1000ms
- **After modularization**: 50-200ms
- **Tool initialization (first use)**: 100-300ms
- **Tool usage (cached)**: 0-10ms

## Debugging

To profile startup time:

```bash
# Add to the top of .zshrc
zmodload zsh/zprof

# Add to the bottom of .zshrc
zprof

# Then reload shell
source ~/.zshrc
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
