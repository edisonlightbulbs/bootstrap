#!/usr/bin/env bash

# -- configuring tilix (!!replace terminix.dconf in cwd with your own)
#    unless you intentionally want to try out my tilix config
dconf load /com/gexperts/Terminix/ < terminix.dconf

# CAVEAT
# -- to save tilix your own settings use (will save settings in in cwd)
# dconf dump /com/gexperts/Terminix/ > terminix.dconf

