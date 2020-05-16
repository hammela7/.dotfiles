#!/bin/zsh
mv ~/.vimrc ~/.dotfiles/backups/
mv ~/.vim ~/.dotfiles/backups/
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/.dotfiles/vim ~/.vim
mv ~/.zshrc ~/.dotfiles/backups
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc  
