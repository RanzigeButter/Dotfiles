#!/bin/sh
#  _           _        _ _       _
# (_)_ __  ___| |_ __ _| | |  ___| |__
# | | '_ \/ __| __/ _` | | | / __| '_ \
# | | | | \__ \ || (_| | | |_\__ \ | | |
# |_|_| |_|___/\__\__,_|_|_(_)___/_| |_|


# Install packages
for x in zsh curl unzip git; do
  sudo apt install -y $x
done

# Set zsh as default shell
sudo chsh -s /bin/zsh

# Create folders
mkdir -p ~/.config/
mkdir -p ~/.cache/
mkdir -p ~/.local/bin/
mkdir -p ~/.local/share/

# Install dotfiles
git clone -b master https://github.com/RanzigeButter/dotfiles.git
cp -rf ~/dotfiles/wsl/* ~/
rm -rf ~/dotfiles ~/install.sh
