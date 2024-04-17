#!/bin/bash

# The script helps you to install and update the dotfiles
# It will help you with the following steps:
#   1. Installing packages with apt + snap
#   2. Installing plugins with git
#   3. Changing the default shell
#   4. Symlinking directories with stow
#   5. Copying config files to home directory

# Absolute path to dotfiles directory
DOTFILES_PATH=$HOME/.dotfiles

APT_PACKAGES=(
  "stow"
  "wget"
  "unzip"
  "git"
  "npm"
  "ripgrep"
  "kitty"
  "fish"
)

SNAP_PACKAGES=(
  "nvim"
)

STOW_DIRECTORIES=(
  "kitty"
  "nvim"
)

COPY_TO_HOMEDIR_DIRECTORIES=(
  "jetbrains"
)

# Switching to dotfiles directory
echo "Switching to dotfiles directory"
pushd $DOTFILES_PATH

# Install apt packages
for package in "${APT_PACKAGES[@]}"
do
  echo "Installing package $package"
  sudo apt-get install -y $package
done

# Install snap packages
for package in "${SNAP_PACKAGES[@]}"
do
  echo "Installing package $package"
  sudo snap install --beta $package --classic
done

# Install Font
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip
unzip Hack.zip -d hackfont
sudo mkdir -p /usr/local/share/fonts/ttf
sudo mv hackfont/HackNerdFontMono-Regular.ttf /usr/local/share/fonts/ttf/
rm -rf hackfont
rm Hack.zip 

# Change default shell
echo "Changing default shell to fish"
chsh -s /usr/bin/fish

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
