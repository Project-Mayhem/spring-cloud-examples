#!/bin/bash

# Update cask first
brew cask update

# See what to install
brew search docker

# Install Docker
brew install docker
brew install docker-clean
brew cask install docker-toolbox
# Install Docker compose and docker machine
brew install docker-compose

# brew items may already be installed.  The above
# commands will fail-fast.  Now, update
brew upgrade docker*

# show what's installed
brew list
