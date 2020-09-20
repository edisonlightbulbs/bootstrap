#!/bin/bash
# INSTALLS:
#   1. aptPackages
#   2. snapPackages
#   3. pipPackages
#   4. npnPackages

sudo apt update

# -- install apt packages
xargs -a <(awk '! /^ *(#|$)/' "apt.txt") -r -- sudo apt-get -y install

# -- install snap packages
xargs -a <(awk '! /^ *(#|$)/' "snap.txt") -r -- sudo snap install

# -- pip install
xargs -a <(awk '! /^ *(#|$)/' "pip.txt") -r -- sudo pip3 install

## -- npm install
xargs -a <(awk '! /^ *(#|$)/' "npm.txt") -r -- sudo npm install -g

# -- python3 install
xargs -a <(awk '! /^ *(#|$)/' "python3.txt") -r sudo python3 -m pip install

sudo chsh -s /usr/bin/zsh root

#          xargs builds and executes commands from STDIN
#   [ -a ] reading directly form the file, i.e., STDIN remains unchanged
#          when commands are run.
#   [ -r ] do not run if empty

#           We use awk to pre-process each line in a given text file, handing
#           over the output of each line to xargs. Piping the file directly to
#           xargs would change STDIN (undesired!).

#           awk allows us to process each line and hand it directly to xargs,
#           leaving STDIN unchanged and ready for the <command>
