#!/bin/zsh
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

ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf

ls -larth ~/.vim ~/.vimrc ~/.zshrc

curl -L git.io/antigen > ~/antigen.zsh
