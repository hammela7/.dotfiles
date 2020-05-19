#!/bin/zsh
sudo apt update && sudo apt upgrade -y && sudo apt install zsh -y
if test -f ~/.vimrc; then
    echo "Backing up .vimrc to .dotfiles/backups/"
    mv ~/.vimrc ~/.dotfiles/backups/
fi
if test -d ~/.vim; then
    echo "Backing up .vim to ~/.dotfiles/backups/"
    mv ~/.vim ~/.dotfiles/backups/
fi
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/.dotfiles/vim ~/.vim
if test -f ~/.zshrc; then
    echo "Backing up .zshrc to ~/.dotfiles/backups/"
    mv ~/.zshrc ~/.dotfiles/backups
fi
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc  
ls -larth ~/.vim ~/.vimrc ~/.zshrc

