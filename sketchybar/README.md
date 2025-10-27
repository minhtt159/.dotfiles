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

3.  **Install**

```sh
(git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/)

```

4. **Font**

Should read the doc on how to install fonts

```sh
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.47/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

```

4.  **Start the bar:**
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
