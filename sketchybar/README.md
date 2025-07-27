# SketchyBar Configuration - Optimized

This is an optimized SketchyBar configuration with modern design and enhanced functionality.

## Features

### Visual Improvements
- **Modern Color Scheme**: Catppuccin-inspired color palette with proper transparency
- **Enhanced Bar**: Rounded corners, subtle shadow, better spacing
- **Consistent Styling**: All widgets have unified background, corner radius, and spacing
- **Better Typography**: Uses SF Pro font family for better readability

### Widgets

#### Left Side
- **Workspaces**: Enhanced Aerospace workspace indicators with better styling
- **Front App**: Current application with icon and name

#### Center
- **Media Player**: Shows currently playing music from Spotify/Apple Music
  - Click to play/pause
  - Auto-hides when no media is playing

#### Right Side (in order)
- **CPU Usage**: Real-time CPU usage with color-coded levels
- **Memory Usage**: Memory usage percentage with color indicators
- **Network Status**: WiFi/Ethernet connection status
- **Volume**: System volume with visual levels and color coding
- **Battery**: Battery percentage with color-coded states and charging indicator
- **Clock**: Enhanced date and time display

### Color Coding
- **Green**: Good status (low CPU/memory usage, full battery, etc.)
- **Yellow**: Warning status (medium usage levels)
- **Orange**: Moderate concern
- **Red**: Critical status (high usage, low battery)
- **Blue**: Charging/active states

## Installation

This configuration is managed via GNU Stow. The configuration will be linked to `~/.config/sketchybar/`.

To reload the configuration:
```bash
sketchybar --reload
```

## Dependencies

- SketchyBar
- Aerospace (for workspace management)  
- SF Pro font family
- sketchybar-app-font (for application icons)

## Configuration Structure

- `sketchybarrc`: Main configuration file
- `colors.sh`: Color definitions
- `icons.sh`: Icon definitions
- `items/`: Widget definitions
- `plugins/`: Widget scripts and logic

## Performance

All widgets are optimized with appropriate update frequencies:
- CPU: Updates every 2 seconds
- Memory: Updates every 5 seconds  
- Network: Updates every 10 seconds
- Battery: Updates every 2 minutes
- Media: Updates every 5 seconds
- Clock: Updates every 30 seconds