#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

set -e

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

cd "$(dirname "$0")"

# homebrew packages

TAPS=(
    homebrew/binary
    homebrew/dupes
    homebrew/versions
    caskroom/cask
    caskroom/versions
    caskroom/fonts
)

FORMULAS=(
    autoconf
    automake
    caskroom/cask/brew-cask
    composer
    coreutils
    htop
    kwm
    lua
    mercurial
    mongodb
    mpv
    mysql
    node
    openssl
    optipng
    postgresql
    python
    screenfetch
    wget
    zsh
)

FONTS=(
  font-source-code-pro-for-powerline
  font-source-code-pro
  font-roboto
  font-hack
)

CASKS=(
    java
    airfoil
    atom
    automatic
    ccleaner
    crashplan
    dropbox
    firefox
    flux
    google-chrome
    google-drive
    google-hangouts
    google-photos-backup
    iterm2
    keepingyouawake
    liteicon
    music-manager
    osxfuse
    qlcolorcode
    qlmarkdown
    qlprettypatch
    qlstephen
    quicklook-csv
    quicklook-json
    skype
    slack
    sourcetree
    spotify
    steam
    the-unarchiver
    transmission
    vagrant
    virtualbox
    vlc
    webpquicklook
    xquartz
    wireshark
)

for tap in ${TAPS[@]}
do
    brew tap $tap
done

brew install ${FORMULAS[@]}

#brew update

brew cask install --appdir="/Applications" ${CASKS[@]}

brew cask install ${FONTS[@]}

# Special cases that need flags...
brew install macvim --env-std --override-system-vim --with-cscope --with-lua --HEAD

brew linkapps macvim

brew cleanup

brew cask cleanup

exit
