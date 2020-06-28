#!/usr/bin/env bash

# A helper script downloading Fira-code-nerd-font and installing it
# If the download link is broken, visit:
#                   https://www.nerdfonts.com/font-downloads
# and update LINK variable

LINK='https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip'
LOCAL_FONT_DIR=' ~/.local/share/fonts/'

# -- download font
wget $LINK


# -- unzip in font directory
mv FiraCode.zip $LOCAL_FONT_DIR
cd $LOCAL_FONT_DIR
unzip FiraCode.zip


# --rebuild for cache
fc-cache -fv
cd -

echo "FiraCode installed"
