#!/bin/zsh
# Symlink the tracked dotfiles into $HOME.
#
# Linux fleet hosts do NOT need this: the Ansible `dotfiles` role makes the same
# symlinks. This is for machines outside the fleet (the Mac) and for bootstrapping
# by hand.
#
# Safe to re-run. An existing symlink is repointed; a real file found in its place
# is moved to backups/ first. The previous version wrote the same block out once
# per file, which had already drifted (inconsistent trailing slashes, no backup
# guard for .tmux.conf, .p10k.zsh missing altogether) and had no `set -e`, no
# `mkdir -p backups`, and no `-f` on `ln` -- so a second run failed the `mv`, then
# failed the `ln`, and still exited 0.

set -euo pipefail

DOTFILES=${DOTFILES:-$HOME/.dotfiles}
BACKUPS=$DOTFILES/backups

echo "Linking dotfiles from $DOTFILES"
for dest src in \
  "$HOME/.vimrc"     "$DOTFILES/vim/.vimrc"    \
  "$HOME/.vim"       "$DOTFILES/vim"           \
  "$HOME/.zshrc"     "$DOTFILES/zsh/zshrc"     \
  "$HOME/.p10k.zsh"  "$DOTFILES/zsh/.p10k.zsh" \
  "$HOME/.tmux.conf" "$DOTFILES/.tmux.conf"
do
  if [[ ! -L $dest && -e $dest ]]; then
    mkdir -p "$BACKUPS"
    echo "  backing up existing $dest -> $BACKUPS/"
    mv "$dest" "$BACKUPS/"
  fi
  ln -sfn "$src" "$dest"
  echo "  $dest -> $src"
done

# Homebrew ships antigen and zshrc prefers it; everywhere else zshrc expects a
# copy at ~/antigen.zsh. Fetched from the same URL and branch the Ansible dotfiles
# role uses, so a Mac and a fleet host run the same antigen -- the old git.io
# shortener redirects to `master` while the role fetches `develop`.
if ! type brew &>/dev/null && [[ ! -f $HOME/antigen.zsh ]]; then
  echo "Fetching antigen to ~/antigen.zsh"
  curl -fsSL \
    https://raw.githubusercontent.com/zsh-users/antigen/develop/bin/antigen.zsh \
    -o "$HOME/antigen.zsh"
fi

echo
ls -larth "$HOME/.vim" "$HOME/.vimrc" "$HOME/.zshrc" "$HOME/.p10k.zsh" "$HOME/.tmux.conf"
