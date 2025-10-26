# .dotfiles

My personal dotfiles for macOS.

## SketchyBar

The SketchyBar configuration has been converted to use Lua for a more modular and maintainable setup, inspired by `FelixKratz/dotfiles`.

### Installation and Usage

1.  **Ensure SketchyBar is installed:**

    ```sh
    brew install FelixKratz/formulae/sketchybar
    ```

2.  **Symlink the configuration directory:**

    ```sh
    ln -s $(pwd)/sketchybar ~/.config/sketchybar
    ```

3.  **Start the bar:**
    The bar can be started by running the `sketchybarrc` script directly.

    ```sh
    ~/.config/sketchybar/sketchybarrc
    ```

    Alternatively, if you are using a window manager like `yabai`, you can add this line to your `yabairc` to start it automatically:

    ```sh
    ~/.config/sketchybar/sketchybarrc &
    ```

### Structure

- `sketchybar/sketchybarrc`: Main executable script that launches the Lua configuration.
- `sketchybar/init.lua`: The entry point for the Lua configuration. It loads all other modules.
- `sketchybar/colors.lua`: Defines the color palette.
- `sketchybar/icons.lua`: Defines all icons.
- `sketchybar/settings.lua`: Contains default settings for items.
- `sketchybar/bar.lua`: Configures the main bar properties.
- `sketchybar/items/`: This directory contains individual Lua files for each bar item (e.g., `clock.lua`, `cpu.lua`).
- `sketchybar/plugins/`: This directory contains the shell scripts that fetch dynamic data for the bar items. These are called by the Lua item configurations.
