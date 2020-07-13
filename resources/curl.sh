#!/bin/bash

# -- nodejs
curl -sL install-node.now.sh | sh

# -- rust
curl https://sh.rustup.rs -sSf | sh

# -- vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
