#!/bin/sh
#
# installer.init.sh
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

function yes_or_no {
  while true; do
    read -p "$* [y/n]: " yn
    case $yn in
      [Yy]*) return 0  ;;  
      [Nn]*) echo -e "Aborted. Edit $brewFile and install using ./installer.sh" ; return 1;
  esac
done
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
	./installer.sh
else
	echo "$brewFile not found, Creating a new $brewFile from .$brewFile."
	# cp ".$brewFile" "$brewFile"
	echo "$brewFile will install the following packages:"
	cat ".$brewFile"
	yes_or_no "Continue installation?" && ./installer.sh
fi