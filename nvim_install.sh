#!/usr/bin/env bash

set -x

# vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# init.vim 
mkdir -p ~/.config/nvim/init.vim
cp init.vim ~/.config/nvim/init.vim
nvim -c PlugInstall
