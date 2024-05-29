#!/bin/sh

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL -n https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

brew update

# Install dependencies with bundle (Brewfile)
brew tap homebrew/bundle
brew bundle

# Clone zsh-autosuggestions if it doesn't exist
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting" ]; then
  git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
fi

# Clone powerlevel10k if it doesn't exist
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
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

# Configure Vim-plug for vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Configure Vim-plug for nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install vim/neovim plugins
vim +PlugInstall +qall
nvim +PlugInstall +qall

# Setup Project Dirs
mkdir $HOME/repos

# Set macOS preferences
source ./.macos

