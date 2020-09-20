#!/bin/bash

curl -sL install-node.now.sh | sh       # nodejs
curl https://sh.rustup.rs -sSf | sh     # rust

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
