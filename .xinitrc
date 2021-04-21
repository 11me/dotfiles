#!/bin/bash

# Sourcing .xprofile
[[ -f ~/.xprofile ]] && . ~/.xprofile

# Enable keybindings
# Start WM
exec "$WM"
#exec i3
#exec dwm
