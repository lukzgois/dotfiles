#!/usr/bin/env sh

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Git
ln -sf $DOTFILES/git/gitconfig $HOME/.gitconfig
ln -sf $DOTFILES/git/gitaliases $HOME/.gitaliases
ln -sf $DOTFILES/git/gitignore_global $HOME/.gitignore_global

# Phpactor
rm -rf $HOME/.config/phpactor
ln -s $DOTFILES/phpactor $HOME/.config/phpactor

# Kitty
rm -rf $HOME/.config/kitty
ln -sf $DOTFILES/kitty $HOME/.config/kitty

# NEOVIM
rm -rf $HOME/.config/nvim
ln -sf $DOTFILES/nvim $HOME/.config/nvim

# Dunst
rm -rf $HOME/.config/dunst
ln -s $DOTFILES/dunst $HOME/.config/dunst

# TMUX
ln -sf $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf

# Kanata
rm -rf $HOME/.config/kanata
ln -sf $DOTFILES/kanata $HOME/.config/kanata

# ZSH
ln -sf $DOTFILES/zsh/aliases $HOME/.aliases
ln -sf $DOTFILES/zsh/functions $HOME/.functions
ln -sf $DOTFILES/zsh/colors $HOME/.colors
ln -sf $DOTFILES/zsh/zshrc $HOME/.zshrc

# Hyprland
rm -rf $HOME/.config/hypr
ln -sf $DOTFILES/hypr $HOME/.config/hypr

# Waybar
rm -rf $HOME/.config/waybar
ln -sf $DOTFILES/waybar $HOME/.config/waybar

# Scripts
mkdir -p $HOME/.local/bin
ln -sf $DOTFILES/scripts/t $HOME/.local/bin/t
