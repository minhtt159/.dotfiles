#!/bin/bash

echo "🎨 Setting up optimized SketchyBar configuration..."

# Check if SketchyBar is installed
if ! command -v sketchybar &> /dev/null; then
    echo "❌ SketchyBar not found. Please install it first:"
    echo "   brew install FelixKratz/formulae/sketchybar"
    exit 1
fi

# Check if Aerospace is installed
if ! command -v aerospace &> /dev/null; then
    echo "⚠️  Aerospace not found. Workspace switching may not work."
    echo "   Install with: brew install --cask nikitabobko/tap/aerospace"
fi

# Make all scripts executable
echo "🔧 Making scripts executable..."
find . -name "*.sh" -exec chmod +x {} \;

# Reload SketchyBar if it's running
if pgrep -x "SketchyBar" > /dev/null; then
    echo "🔄 Reloading SketchyBar..."
    sketchybar --reload
    echo "✅ SketchyBar reloaded successfully!"
else
    echo "ℹ️  SketchyBar is not running. Start it with:"
    echo "   brew services start sketchybar"
fi

echo ""
echo "🎉 Setup complete! Your SketchyBar is now optimized with:"
echo "   • Modern color scheme and design"
echo "   • CPU, Memory, and Network monitoring"
echo "   • Enhanced battery display with color coding"
echo "   • Media player controls"
echo "   • Better workspace indicators"
echo ""
echo "📖 See README.md for more details and customization options."