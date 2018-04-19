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
if is_installed brew; then
  brew update
  brew doctor
else
  echo "Installing brew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "brew installed"
fi

# Install CLI Mac App store
if is_installed mas; then
  read -p 'Mac App store email: ' email	
  mas signin $email
  echo "Signed in ($email)"
else
  echo "Installing mas"
  brew install mas
  echo "mas installed"
fi

# Install brew bundle
brewFile="Brewfile"
if [ -f "$brewFile" ]
then
	echo "$brewFile found, .$brewFile will be ignored."
	echo "Installing the bundle..."
	brew bundle install
else
	cp ".$brewFile" "$brewFile"
	echo "$brewFile not found, Created a new $brewFile from .$brewFile."
fi