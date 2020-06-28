#!/usr/bin/env bash
# SCRIPT DEPENDENCIES:
#    1. Curl
#    2. Rust


# -- install script dependencies
sudo apt-get install curl -y
curl https://sh.rustup.rs -sSf | sh


# -- adding personal package archives (ppa):

# obs
sudo add-apt-repository ppa:obsproject/obs-studio

# openrazer
sudo add-apt-repository ppa:openrazer/stable
sudo add-apt-repository ppa:polychromatic/stable

# -- installing snap
sudo apt install snapd


# -- update
sudo apt update 


# -- installing zsh
sudo apt install zsh
sudo chsh -s /usr/bin/zsh root
# !! TO USE ZSH
#    open terminal:
#                   > preference > profiles > command >
#                   i. Set: Run command as a logging
#                  ii. Set: Run a custom command instead of my shell
#
#                  custom command to enter is (zsh)



# ------------------- package installation -------------------
# notes:
#        Process substitution redirects the output of awk into a file
#        descriptor for xargs -a to read from.
#        The -a option reads items directly from a file and not stdin.
#        We don't want to pipe a file into xargs because stdin must
#        remain unchanged for use by apt-get.
#
cd 'resources/packages'
xargs -a <(awk '! /^ *(#|$)/' "dependencies.txt") -r -- sudo apt-get -y install
xargs -a <(awk '! /^ *(#|$)/' "opengl.txt") -r -- sudo apt-get -y install
xargs -a <(awk '! /^ *(#|$)/' "dev.txt ") -r -- sudo apt-get -y install
xargs -a <(awk '! /^ *(#|$)/' "git.txt") -r -- sudo apt-get -y install
xargs -a <(awk '! /^ *(#|$)/' "snap.txt ") -r -- sudo snap install
cd -
# ------------------- package installation -------------------


# -- auto loading vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# -- installing sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list


# --installing dropbox <----- causes install script to hang
# cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
# ~/.dropbox-dist/dropboxd

