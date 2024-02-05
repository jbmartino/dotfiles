#!/bin/sh

echo "Cloning repos..."

REPOS=$HOME/repos
DOTFILES=$HOME/

# Dotfiles
git clone git@github.com:jbmartino/dotfiles.git $DOTFILES

# Personal
git clone git@github.com:jbmartino/railsguides.git $REPOS
