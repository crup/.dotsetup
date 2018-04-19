#!/bin/sh
#
# installer.sh
#
# Quickstart repo for setup and configurations
#
# Based on https://github.com/kevinelliott/.dotfiles/blob/master/install.sh


# Die on failures
set -e

# Check if package exists or not
is_installed () {
  type "$1" &> /dev/null ;
}

# Install or update homebrew
if command_exists brew; then
  brew update
else
  echo "Installing brew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "brew installed"
fi

