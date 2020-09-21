#!/bin/bash
# INSTALL PACKAGES LISTED IN Packages/*.txt:

#  We use awk to pre-process each line in a given text file, handing over the
#  output of each line to xargs. AWK Allows us to process each line and hand it
#  directly to xargs, leaving STDIN unchanged.
#    [ -a ] read directly from file and leave STDIN unchanged when reading each
#    line as a  command.
#    [ -r ] do not run if line empty is empty.

sudo apt update

# -- install apt packages
xargs -a <(awk '! /^ *(#|$)/' "packages/apt.txt") -r -- sudo apt-get -y install

# -- pip install
xargs -a <(awk '! /^ *(#|$)/' "packages/npm.txt") -r -- sudo pip3 install

## -- npm install
xargs -a <(awk '! /^ *(#|$)/' "packages/pip3.txt") -r -- sudo npm install -g

# -- python3 install
xargs -a <(awk '! /^ *(#|$)/' "packages/py3.txt") -r sudo python3 -m pip install

