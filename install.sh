#!/usr/bin/env sh

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Git
ln -sf $DOTFILES/git/gitconfig $HOME/.gitconfig
ln -sf $DOTFILES/git/gitaliases $HOME/.gitaliases
ln -sf $DOTFILES/git/gitignore_global $HOME/.gitignore_global

# Phpactor
rm -rf $HOME/.config/phpactor
ln -s $DOTFILES/phpactor $HOME/.config/phpactor

# Phpactor
rm -rf $HOME/.config/dunst
ln -s $DOTFILES/dunst $HOME/.config/dunst

# Scripts
mkdir -p $HOME/.local/bin
ln -sf $DOTFILES/scripts/t $HOME/.local/bin/t
