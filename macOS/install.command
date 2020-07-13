#!/usr/bin/env bash

# -- installing brew
if test ! $(which brew); then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &>/dev/null
fi

# -- adding brew taps TODO:
# xargs -a <(awk '{print $0}' brew_tap.txt) -r brew tap

# -- updating
brew update &>/dev/null

printf ' %.s-- installing apps using brew ...\n'

# -- brew install
xargs -a <(awk '! /^ *(#|$)/' "brew.txt") -r -- brew install

# -- brew cask install
xargs -a <(awk '! /^ *(#|$)/' "brew_cask.txt") -r -- brew cask install

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

printf ' %.s-- checking for updates\n'

brew update &>/dev/null
brew upgrade &>/dev/null
brew cask upgrade

printf ' %.s-- house keeping\n'

brew cleanup

printf ' %.s-- installation complete!\n'
