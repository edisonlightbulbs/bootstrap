#!/bin/bash

# -- adding ppa repositories TODO:
# xargs -a <(awk '{print $0}' ppa.txt) -r -- sudo add-apt-repository
# awk '{print $0}' ppa.txt

# -- updating (just un-comment!)
sudo apt update

# -- apt install
xargs -a <(awk '! /^ *(#|$)/' "apt.txt") -r -- sudo apt-get -y install

# -- snap install
xargs -a <(awk '! /^ *(#|$)/' "snap.txt") -r -- sudo snap install

# -- installing snap packages with classic override TODO:
#xargs -a <(awk '! /^ *(#|$)/' "test_snap.txt") -i -r -- sudo snap install {} --classic

# -- updating
sudo apt update

# -- pip install
xargs -a <(awk '! /^ *(#|$)/' "../resources/pip.txt") -r -- sudo pip install

## -- npm install
xargs -a <(awk '! /^ *(#|$)/' "../resources/npm.txt") -r -- sudo npm install -g

# -- python3 install
xargs -a <(awk '! /^ *(#|$)/' "../resources/python3.txt") -r sudo python3 -m pip install


# DECOMPOSING: package installation strategy
# -- xargs builds and executes commands from STDIN
#    [ -a ] reading directly form the file, i.e., STDIN remains unchanged
#           when commands are run.
#    [ -r ] do not run if empty

# -- We use awk to pre-process each line in a given text file, handing over
#    the output of each line to xargs. Piping the file directly to xargs would
#    change STDIN (undesired!).
#
# -- awk allows us to process each line and hand it directly to xargs,
#    leaving STDIN unchanged and ready for the <command>
#
#    n.b.: '! /^ *(#|$)/'

sudo bash ../resources/curl.sh
sudo bash ../resources/wget.sh
sudo chsh -s /usr/bin/zsh root
