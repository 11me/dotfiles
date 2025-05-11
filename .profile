export HISTCONTROL=ignoreboth
export HISTFILESIZE=10000
export HISTSIZE=10000
export HISTFILE="$HOME/.cache/.bash_history"
export CDPATH=".:~:~/repos"

if [[ "$TERM" != "screen" ]]; then
  export TERM=screen-256color
fi

# Default programms
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"
export SUDO_PROMPT="password 🔑:"
export GOMAXPROCS="$(nproc)"
#export LYNX_CFG="$HOME/.config/lynx/lynx.cfg"

# Clean up
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

#This file runs on login
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# Start graphical server on tty1 if not already running.
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
