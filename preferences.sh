#!/bin/sh
#
# Mac preferences
#

echo "Setting up preferences"

echo "Enabling reduce motion"
# Enable reduce motion to remove OSX's default sluggish Mission Control animation
defaults write com.apple.universalaccess reduceMotion -bool true

echo "Enabling dragging"
### Require restart
# Enable dragging
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -int 1
defaults write com.apple.AppleMultitouchTrackpad Dragging -int 1

echo "Enabling three finger dragging"
# Enable three finger dragging
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int 1

echo "Speeding up keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

echo "Changing default directory for screenshots"
# Change default directory for screenshots
mkdir ~/Desktop/Screenshots
defaults write com.apple.screencapture location ~/Desktop/Screenshots

echo "Show all file extensions in Finder"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Enable full keyboard access"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Disable spell correction"
defaults write NSAutomaticSpellingCorrectionEnabled -bool false

echo "Change Dock size, magnification and enable autohide"
defaults write com.apple.dock tilesize -int 30
defaults write com.apple.dock largesize -float 60
defaults write com.apple.dock magnification -int 1
defaults write com.apple.dock show-process-indicators -int 0
defaults write com.apple.dock autohide -int 1
killall Dock

echo "Show only active apps in Dock"
defaults write com.apple.dock static-only -bool true; killall Dock

echo "Saved preferences"
























