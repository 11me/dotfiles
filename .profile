#This file runs on login


# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx

#[[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"


# Fast listing
alias la="ls -a"
alias ll="ls -l"
alias lal="ls -al"

# Make config changes easy in suckless programs
alias dwmrc='cd $HOME/.local/src/dwm && $EDITOR config.h'
alias strc='cd $HOME/.local/src/st-luke && $EDITOR config.h'
alias dmenurc='cd $HOME/.local/src/dmenu && $EDITOR config.h'
alias smci='sudo -A make clean install'
alias prc='$EDITOR $HOME/.profile'
alias brc='$EDITOR $HOME/.bashrc' 

# Actions
alias todo='$EDITOR $HOME/dox/personal/todo'
alias vi='$EDITOR'

# Local folders
alias hc='cd $HOME/.config'
alias hl='cd $HOME/.local'
alias hlb='cd $HOME/.local/bin'
alias hlsrc='cd $HOME/.local/src'
alias hp='cd $HOME/pix'
alias hd='cd $HOME/dox'
alias hdw='cd $HOME/dwns'

#Default programms
export EDITOR="$EDITOR"
export TERMINAL="st"
export BROWSER="firefox"

export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"

export PATH="$PATH:~/.local/bin"


