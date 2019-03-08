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
    caskroom/cask
    caskroom/versions
    caskroom/fonts
)

FORMULAS=(
    node
    neofetch
    zsh
)

FONTS=(
  font-source-code-pro-for-powerline
  font-fira-code
  font-source-code-pro
  font-roboto
  font-hack
)

CASKS=(
    java
    dropbox
    iterm2
    keepingyouawake
    sourcetree
    spotify
    transmission
    vlc
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
