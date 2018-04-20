#!/bin/sh
#
# installer.sh
#
# Brew installer
#

# Install brew bundle

echo "Installing Brewfile bundle..."
brew bundle install
xcode-select --install
sudo xcode-select --switch /Library/Developer/CommandLineTools
sudo xcodebuild -license
