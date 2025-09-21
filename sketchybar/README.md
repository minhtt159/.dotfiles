# SketchyBar SbarLua Configuration

This directory contains both the original shell-based SketchyBar configuration and the new SbarLua-based configuration.

## Files Structure

### SbarLua Configuration (Recommended)
- `init.lua` - Main entry point for SbarLua configuration
- `bar.lua` - Bar appearance settings
- `default.lua` - Default item properties
- `colors.lua` - Color definitions (converted from colors.sh)
- `icons.lua` - Icon definitions (converted from icons.sh)
- `settings.lua` - General settings
- `items/` - Directory containing individual item configurations
  - `init.lua` - Items loader
  - `spaces.lua` - Aerospace workspaces
  - `front_app.lua` - Current application display
  - `clock.lua` - Date and time display
  - `volume.lua` - Volume control
  - `battery.lua` - Battery status
- `items.lua` - Alias for items/init.lua

### Legacy Shell Configuration (Reference)
- `sketchybarrc.sh` - Original shell-based configuration
- `colors.sh` - Original color definitions
- `icons.sh` - Original icon definitions
- `items/` - Original shell item scripts
- `plugins/` - Original shell plugin scripts

## Installation

1. Install SbarLua:
```bash
(git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/)
```

2. The main `sketchybarrc` will automatically use SbarLua if installed, or fall back to the shell configuration.

## Benefits of SbarLua

- **Better Performance**: Lua scripts run faster than shell scripts
- **Improved Event Handling**: More responsive to system events
- **Async Operations**: Non-blocking command execution with `sbar.exec()`
- **Structured Configuration**: Better code organization and modularity
- **Type Safety**: Lua's type system helps prevent configuration errors

## Migration Notes

The SbarLua configuration maintains all functionality from the original shell configuration:

- All items (spaces, front_app, clock, volume, battery) are preserved
- Aerospace workspace integration is maintained
- Icon mapping for applications is converted to Lua table
- Color and styling remains identical
- Plugin functionality is integrated into Lua event handlers

## Troubleshooting

If you encounter issues:

1. Check if SbarLua is properly installed: `ls ~/.local/share/sketchybar_lua/`
2. View logs: The configuration will automatically fall back to shell if SbarLua is not available
3. Test Lua syntax: `lua -c "dofile('init.lua')"`

For more information, see:
- [SbarLua Repository](https://github.com/FelixKratz/SbarLua)
- [SketchyBar Documentation](https://felixkratz.github.io/SketchyBar/)