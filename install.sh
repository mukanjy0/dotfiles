#!/bin/bash
########
# nvim #
########
mkdir -p "$XDG_CONFIG_HOME/nvim"
mkdir -p "$XDG_CONFIG_HOME/nvim/undo"
ln -sf "$DOTFILES/nvim/init.vim" "$XDG_CONFIG_HOME/nvim/init.vim"
ln -sf "$DOTFILES/nvim/init_plugins.vim" "$XDG_CONFIG_HOME/nvim/init_plugins.vim"
# UltiSnips
mkdir -p "$XDG_CONFIG_HOME/nvim/UltiSnips"
ln -sf "$DOTFILES/nvim/UltiSnips/cpp.snippets" "$XDG_CONFIG_HOME/nvim/UltiSnips/cpp.snippets"
#######
# X11 #
#######
rm -rf "$XDG_CONFIG_HOME/X11"
ln -s "$DOTFILES/X11" "$XDG_CONFIG_HOME/X11"
######
# i3 #
######
rm -rf "$XDG_CONFIG_HOME/i3"
ln -s "$DOTFILES/i3" "$XDG_CONFIG_HOME/i3"
#######
# ZSH #
#######
mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh"
rm -rf "$XDG_CONFIG_HOME/zsh/external"
ln -s "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh"
#########
# Dunst #
#########
mkdir -p "$XDG_CONFIG_HOME/dunst"
ln -sf "$DOTFILES/dunst/dunstrc" "$XDG_CONFIG_HOME/dunst"
#########
# sxhkd #
#########
mkdir -p "$XDG_CONFIG_HOME/sxhkd"
ln -sf "$DOTFILES/sxhkd/sxhkdrc" "$XDG_CONFIG_HOME/sxhkd"
#########
# Fonts #
#########
mkdir -p "$XDG_DATA_HOME"
cp -rf "$DOTFILES/fonts" "$XDG_DATA_HOME"
