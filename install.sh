#!/bin/sh

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL -n https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Remove existing .zshrc & symlink .zshrc from dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc

# Remove existing .vimrc & symlink .vimrc from dotfiles
rm -rf $HOME/.vimrc
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc

# Remove existing init.vim & symlink init.vim from dotfiles
[ -d $HOME/.config/nvim ] || mkdir -p $HOME/.config/nvim
rm -rf $HOME/.config/nvim/init.vim
ln -s $HOME/dotfiles/init.vim $HOME/.config/nvim/init.vim

brew update

# Install dependencies with bundle (Brewfile)
brew tap homebrew/bundle
brew bundle

# Configure Vim-plug for nvim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Setup Project Dirs
mkdir $HOME/repos

# Clone repos
./clone.sh

# Set macOS preferences
source ./.macos

