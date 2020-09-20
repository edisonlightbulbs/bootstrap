#!/bin/bash
# INSTALLS:
#   1. aptPackages
#   2. snapPackages
#   3. pipPackages
#   4. npnPackages

#  We use awk to pre-process each line in a given text file, handing over the
#  output of each line to xargs. AWK Allows us to process each line and hand it
#  directly to xargs, leaving STDIN unchanged.
#    [ -a ] read directly from file and leave STDIN unchanged when reading each
#    line as a  command.
#    [ -r ] do not run if line empty is empty.

sudo apt update

# -- install apt packages
xargs -a <(awk '! /^ *(#|$)/' "packages/aptPackages.txt") -r -- sudo apt-get -y install

# -- pip install
xargs -a <(awk '! /^ *(#|$)/' "packages/npmPackages.txt") -r -- sudo pip3 install

## -- npm install
xargs -a <(awk '! /^ *(#|$)/' "packages/pipPackages.txt") -r -- sudo npm install -g

# -- python3 install
xargs -a <(awk '! /^ *(#|$)/' "packages/py3Packages.txt") -r sudo python3 -m pip install

sudo chsh -s /usr/bin/zsh root
