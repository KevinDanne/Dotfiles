#!/bin/bash

# The script helps you to install and update the dotfiles
# It will help you with the following steps:
#   1. Installing packages with pacman
#   2. Installing plugins with git
#   3. Changing the default shell
#   4. Enabling services
#   5. Symlinking directories with stow

# Absolute path to dotfiles directory
DOTFILES_PATH=$HOME/.dotfiles

PACKAGES=(
  "stow"
  "wget"
  "unzip"
  "git"
  "npm"
  "ripgrep"
  "neovim"
  "i3"
  "rofi"
  "kitty"
  "fish"
  "sddm"
)

STOW_DIRECTORIES=(
  "i3"
  "kitty"
  "nvim"
  "rofi"
)

# Switching to dotfiles directory
echo "Switching to dotfiles directory"
pushd $DOTFILES_PATH

# Install packages
for package in "${PACKAGES[@]}"
do
  echo "Installing package $package"
  sudo pacman -S $package
done

# Install Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Hack.zip
unzip Hack.zip -d hackfont
sudo mkdir -p /usr/local/share/fonts/ttf
sudo mv hackfont/Hack\ Regular\ Nerd\ Font\ Complete\ Mono.ttf /usr/local/share/fonts/ttf/HackNerdFontMono.ttf
rm -rf hackfont
rm Hack.zip 

# Change default shell
echo "Changing default shell to fish"
chsh -s /usr/bin/fish

# Enable services
echo "Enabling sddm service"
sudo systemctl enable sddm

# Symlink directories
for directory in "${STOW_DIRECTORIES[@]}"
do
  echo "Stow directory $directory"
  stow -D $directory
  stow $directory
done

# Switching to previous directory
echo "Switching back to previous directory"
popd
