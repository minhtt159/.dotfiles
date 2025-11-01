# NOTE: https://macos-defaults.com/

echo "Install MacOS defaults"

# -- Dock
# On the right side
defaults write com.apple.dock "orientation" -string "right"
# Auto hide
defaults write com.apple.dock "autohide" -bool "true"
# Minimize effect
defaults write com.apple.dock "mineffect" -string "scale"
# Hide taksbar
defaults write com.apple.dock autohide -bool true
# Show recent apps
defaults write com.apple.dock "show-recents" -bool "false"
# Rearrange Spaces based on most recent use
defaults write com.apple.dock "mru-spaces" -bool "false"
# Group windows in expose
defaults write com.apple.dock expose-group-apps -bool true

# -- Finder
# Column View Style
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv"
# Desktop
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "false"
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool "false"
defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool "false"

# -- Spaces
defaults write com.apple.spaces spans-displays -bool false
