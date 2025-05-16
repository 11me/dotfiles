#This file runs on login
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

if command -v xset >/dev/null; then
    xset r rate 300 50 # Speed xrate up
    xset -b            # Turn off awful beep sound
    xset s off -dpms   # Do not turn off the screen
fi

# Start graphical server on tty1 if not already running.
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
