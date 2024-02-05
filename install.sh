#!/bin/sh

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Remove existing .zshrc & symlink .zshrc from dotfiles
rm -rf $HOME/.zshrc
ln -s .zshrc $HOME/.zshrc

# Remove existing .vimrc & symlink .vimrc from dotfiles
rm -rf $HOME/.vimrc
ln -s .vimrc $HOME/.vimrc

brew update

# Install dependencies with bundle (Brewfile)
brew tap homebrew/bundle
brew bundle

# Setup Project Dirs
mkdir $HOME/repos

# Set macOS preferences
source ./.macos
