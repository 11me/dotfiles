# Created by newuser for 5.8

[ -f $HOME/.zprofile ] && source $HOME/.zprofile

autoload -U colors && colors	# Load colors
setopt autocd		# Automatically cd into typed directory
stty stop undef		# Disable ctrl-s to freeze terminal

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
