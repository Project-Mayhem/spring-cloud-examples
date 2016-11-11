#!/bin/bash

# Download and install xcode if not done already
# See https://coolestguidesontheplanet.com/installing-homebrew-os-x-yosemite-10-10-package-manager-unix-apps/


# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# check for any brew issues
brew doctor

# setup cask
brew tap caskroom/cask
brew install homebrew/completions/brew-cask-completion

brew update cask

# brew stores apps in /usr/local/Cellar/
