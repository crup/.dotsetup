is_installed () {
  type "$1" &> /dev/null ;
}

if is_installed mas; then
  sudo mas uninstall 409183694 #Keynote
  sudo mas uninstall 408981434 #iMovie
  sudo mas uninstall 682658836 #GarageBand
  sudo mas uninstall 409203825 #Numbers
else
  echo "Install mas"
fi