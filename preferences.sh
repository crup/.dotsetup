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
