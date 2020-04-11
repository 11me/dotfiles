#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[ -f $HOME/.profile ] && source $HOME/.profile

#PS1='[\u@\h \W]\$ '
PS1="\[\033[38;5;27m\][\[$(tput sgr0)\]\[\033[38;5;40m\]\u\[$(tput sgr0)\]\[\033[38;5;154m\]@\[$(tput sgr0)\]\[\033[38;5;226m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;208m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;27m\]]\[$(tput sgr0)\]\[\033[38;5;226m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

#Adds completion
complete -cf sudo

#Search through bash's history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

#Auto cd
shopt -s autocd

alias ls='ls --color=auto'
