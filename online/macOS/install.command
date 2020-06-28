#!/usr/bin/env bash

## SCRIPT INSTALL STRATEGY:
##   IF VERSION CHECK FAILS, ASSUME UNINSTALLED AND TRY TO INSTALL.

# -- making sure we have xcode
xcode-select --version || xcode-select --install &>/dev/null

# -- installing the latest stable version of nodejs
curl -sL install-node.now.sh | sh


# -- installing brew
if test ! $(which brew); then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &>/dev/null
fi


# ----------------------- brew taps -----------------------
brew tap jhawthorn/fzy
brew tap homebrew/cask-fonts


# ------------------- FOR: brew installs -------------------

OPENGL=(
    glew
    glfw3
)

GIT=(
    git
    git-lfs
    git-flow
)

C=(
    cmake
)

JAVA=(
    java11
    gradle
)

VIM=(
    macvim
)

DEPENDENCIES=(
    fd
    bat
    node
    exa
    fzf
    gpg
    ccat
    lynx
    wget
    tmux
    tree
    grip
    pandoc
    fzy
    ccat
    autojump
    pinentry-mac
    pandoc-citeproc
    macvim
    mono
    go
    python3
    nodejs
    neomutt/homebrew-neomutt/neomutt
)

# ---------------- FOR: brew cask installs ----------------

IDES=(
    clion
    pycharm-ce
    android-studio
    intellij-idea
)

CASK_JAVA=(
    java
    homebrew/cask-versions/adoptopenjdk8
)

SYSTEM_UTILITIES=(
    iterm2
    alfred
    bartender
    cleanmymac
    karabiner-elements
)

TEXT_EDITORS=(
    mactex
    sublime-text2
)

OTHER=(
    mendeley
    cheatsheet
    google-chrome
    mendeley-reference-manager
)

MEDIA_TOOLS=(
    obs
    vlc
    spotify
    c0re100-qbittorrent
)

SOCIAL_APPS=(
    skype
    slack
)

SECURITY_TOOLS=(
    dashlane
)

CLOUD_SERVICES=(
    dropbox
    google-drive-file-stream
)


FONTS=(
    font-fira-code-nerd-font
)

## CALLING BREW CASK MULTIPLE TIMES IS TEDIOUS, BUT, I PERSONALLY PREFER
## SEEING STATUS FEEDBACK SPECIFIC TO EACH PACKAGE GROUP I AM INSTALLING.

brew ls --versions ${OPENGL[@]} &>/dev/null || brew install ${OPENGL[@]} 2>/dev/null
printf ' %.s-- OPENGL tools installation - done \n'
brew ls --versions ${GIT[@]} &>/dev/null || brew install ${GIT[@]} 2>/dev/null
printf ' %.s-- GIT tools installation - done \n'
brew ls --versions ${C[@]} &>/dev/null || brew install ${C[@]} 2>/dev/null
printf ' %.s-- C tools installation - done \n'
brew ls --versions ${JAVA[@]} &>/dev/null || brew install ${JAVA[@]} 2>/dev/null
printf ' %.s-- JAVA tools installation - done \n'
brew ls --versions ${VIM[@]} &>/dev/null || brew install ${VIM[@]} 2>/dev/null
printf ' %.s-- VIM installation - done \n'
brew ls --versions ${DEPENDENCIES[@]} &>/dev/null || brew install ${DEPENDENCIES[@]} 2>/dev/null
printf ' %.s-- SHELL tools installation - done \n'


brew cask ls --versions ${IDES[@]} &>/dev/null || brew cask install ${IDES[@]} 2>/dev/null
printf ' %.s-- IDE installation - done \n'
brew cask ls --versions ${LANGUAGES[@]} &>/dev/null || brew cask install ${LANGUAGES[@]} 2>/dev/null
printf ' %.s-- LANGUAGE installation - done \n'
brew cask ls --versions ${SYSTEM_UTILITIES[@]} &>/dev/null || brew cask install ${SYSTEM_UTILITIES[@]} 2>/dev/null
printf ' %.s-- UTILITY-APPS installation - done \n'
brew cask ls --versions ${TEXT_EDITORS[@]} &>/dev/null || brew cask install ${TEXT_EDITORS[@]} 2>/dev/null
printf ' %.s-- TEXT_EDITORS installation - done \n'
brew cask ls --versions ${OTHER[@]} &>/dev/null || brew cask install ${OTHER[@]} 2>/dev/null
printf ' %.s-- OTHER installation - done \n'
brew cask ls --versions ${MEDIA_TOOLS[@]} &>/dev/null || brew cask install ${MEDIA_TOOLS[@]} 2>/dev/null
printf ' %.s-- MEDIA_TOOLS-TOOLS installation - done \n'
brew cask ls --versions ${SOCIAL_APPS[@]} &>/dev/null || brew cask install ${SOCIAL_APPS[@]} 2>/dev/null
printf ' %.s-- SOCIAL_APPS-APPS installation - done \n'
brew cask ls --versions ${SECURITY_TOOLS[@]} &>/dev/null || brew cask install ${SECURITY_TOOLS[@]} 2>/dev/null
printf ' %.s-- SECURITY_TOOLS-APPS installation - done \n'
brew cask ls --versions ${CLOUD_SERVICES[@]} &>/dev/null || brew cask install ${CLOUD_SERVICES[@]} 2>/dev/null
printf ' %.s-- CLOUD-APPS installation - done \n'
brew cask ls --versions ${FONTS[@]} &>/dev/null || brew cask install ${FONTS[@]} 2>/dev/null
printf ' %.s-- FONT installation - done \n'


# -- brew house keeping
brew update &>/dev/null
brew upgrade &>/dev/null
brew cask upgrade
brew cleanup

printf ' %.s-- INSTALLATION COMPLETE!\n'
