#!/usr/bin/env bash

set -x

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# init.vim 
cp init.vim ~/.vimrc
vim -c PlugInstall
