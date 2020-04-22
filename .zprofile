#This file runs on login

# Default programms
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"

# Clean up
export PATH="$PATH:~/.local/bin"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export ZDOTDIR="$HOME/.config/zsh"

# Fast listing
alias ls="ls --color=auto"
alias la="ls -a"
alias ll="ls -l"
alias lal="ls -al"

# Make config changes easy in suckless programs
alias dwmrc='cd $HOME/.local/src/dwm && $EDITOR config.def.h'
alias strc='cd $HOME/.local/src/st && $EDITOR config.h'
alias dmenurc='cd $HOME/.local/src/dmenu && $EDITOR config.def.h'
alias smci='sudo -A make clean install'

# Some useful aliases
alias prc='$EDITOR $HOME/.zprofile'
alias zrc='$EDITOR $HOME/.config/zsh/.zshrc'
alias ignore='$EDITOR $HOME/.gitignore'
alias vimrc='$EDITOR $HOME/.config/nvim/init.vim'

# Actions
alias todo='$EDITOR $HOME/dox/personal/todo'
alias vi='$EDITOR'

# Git cmds
alias gs='git status'
alias gc='git commit -m'
alias gck='git checkout'
alias ga='git add'
alias gp='git push'

# Local folders
alias hc='cd $HOME/.config'
alias hl='cd $HOME/.local'
alias hlb='cd $HOME/.local/bin'
alias hlsrc='cd $HOME/.local/src'
alias hp='cd $HOME/pix'
alias hd='cd $HOME/dox'
alias hdw='cd $HOME/dwns'
alias zd='cd $HOME/.config/zsh'



# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
