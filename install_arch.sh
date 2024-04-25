#!/bin/bash

# The script helps you to install and update the dotfiles
# It will help you with the following steps:
#   1. Installing packages with pacman
#   2. Installing plugins with git
#   3. Changing the default shell
#   4. Enabling services
#   5. Symlinking directories with stow
#   6. Copying config files to home directory

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
  "zsh"
  "sddm"
)

STOW_DIRECTORIES=(
  "i3"
  "rofi"
  "kitty"
  "nvim"
)

COPY_TO_HOMEDIR_DIRECTORIES=(
  "jetbrains"
)

# Switching to dotfiles directory
echo "Switching to dotfiles directory"
pushd $DOTFILES_PATH

# Install pacman packages
for package in "${PACKAGES[@]}"
do
  echo "Installing package $package"
  sudo pacman -S $package
done

# Install ohmyzsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Font
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip
unzip Hack.zip -d hackfont
sudo mkdir -p /usr/local/share/fonts/ttf
sudo mv hackfont/HackNerdFontMono-Regular.ttf /usr/local/share/fonts/ttf/
rm -rf hackfont
rm Hack.zip 

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

# Copy config files to home directory
for directory in "${COPY_TO_HOMEDIR_DIRECTORIES[@]}"
do
  echo "Copying files from $directory to ~/"
  cp -r $directory ~/
done

# Switching to previous directory
echo "Switching back to previous directory"
popd
