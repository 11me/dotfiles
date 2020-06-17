#!/bin/bash

# Sourcing .xprofile
[[ -f ~/.xprofile ]] && . ~/.xprofile
[[ -f ~/.profile ]] && . ~/.profile

# Enable keybindings
# Start WM
exec dwm
