#!/bin/bash

# Install Figlet
sudo apt-get install -y figlet

# Install amass

## Install w/ snap
if which snap >/dev/null ; then
    sudo snap install amass
else
    echo "Error: I don't have 'snap' installed! Using homebrew."
fi

## Install w/ brew
if which brew >/dev/null; then
    brew tap caffix/amass
    brew install amass
else
    echo "Error: I don't have 'brew' installed! Using go."
fi

## Install w/ go
if which go >/dev/null; then
    go get -v -u github.com/OWASP/Amass/v3/...
else
    echo "Error: I don't have 'go' installed! Aborting."
    exit 1;
fi    
