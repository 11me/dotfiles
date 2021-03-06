shopt -s checkwinsize globstar complete_fullquote expand_aliases extquote\
 	 extglob force_fignore hostcomplete interactive_comments xpg_echo\
 	 promptvars sourcepath progcomp autocd cdspell dirspell direxpand\
 	 nocasematch histappend cmdhist lithist

################# options ####################
set -o vi
shopt -s histappend

################# colors ####################

red='\[\e[31m\]'
green='\[\e[32m\]'
yellow='\[\e[33m\]'
blue='\[\e[34m\]'
magenta='\[\e[35m\]'
cyan='\[\e[36m\]'
white='\[\e[37m\]'
x='\[\e[0m\]' # reset

################# exports ####################

export HISTCONTROL='ignoreboth'
export HISTFILESIZE=1000
export HISTSIZE=1000
export HISTFILE="$HOME/.cache/.bash_history"
export CDPATH=".:~:~/dox:~/dox/projects:~/dox/books"
export SCRIPTS="$HOME/.local/bin"
export GOBIN="$HOME/go/bin"

# Default programms
export EDITOR="vim"
export VIMRC="$HOME/.vim/vimrc"
export TERMINAL="st"
export FILEMANAGER="lf"
export BROWSER="librewolf"
export STATUSBAR="dwmblocks"
export WM="dwm"
#export WM="i3"
#export STATUSBAR="i3blocks"
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export SUDO_PROMPT="password 🔑:"
export JAVA_HOME="/usr/lib/jvm/java-15-openjdk"

# Clean up
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export ZDOTDIR="$HOME/.config/zsh"

# Server name for rsync
export SERVER="server"

export GOMAXPROCS="$(nproc)"
export LYNX_CFG="$HOME/.config/lynx/lynx.cfg"

################# functions ####################

c() {
  printf "\e[H\e[2J"
} && export -f c

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
} && export -f lfcd

# add at the end of the path
pathappend() {
  declare arg
  for arg in "$@"; do
    test -d "${arg}" || continue
    PATH=${PATH//:${arg}:/:}
    PATH=${PATH/#${arg}:/}
    PATH=${PATH/%:${arg}/}
    export PATH="${PATH:+"${PATH}:"}${arg}"
  done
}

# add at the beginning of the path
pathprepend() {
  for ARG in "$@"; do
    test -d "${ARG}" || continue
    PATH=${PATH//:${ARG}:/:}
    PATH=${PATH/#${ARG}:/}
    PATH=${PATH/%:${ARG}/}
    export PATH="${ARG}${PATH:+":${PATH}"}"
  done
}

# remember last arg will be first in path
pathprepend \
  $SCRIPTS \
  $HOME/.fnm \
  $JAVA_HOME/bin   #JAVA_HOME is set in .profile

#export PATH="$PATH:/home/$USER/.local/bin:/home/lime/.fnm:$JAVA_HOME/bin"
pathappend \
  /usr/local/bin \
  /usr/local/sbin \
  /usr/sbin \
  /usr/bin \
  /sbin \
  /bin


################# prompt ####################

__prompt() {

  local B="$(git branch --show-current 2>/dev/null)"
  if test -n "$B"; then
    B=" ($B)"
  else
    B=""
  fi

  PS1="${red}${yellow}\w${blue}$B\n${blue}λ${x} "

}

export PROMPT_COMMAND='__prompt'

################# pager ######################

if test -x /usr/bin/lesspipe; then
  export LESSOPEN="| /usr/bin/lesspipe %s";
  export LESSCLOSE="/usr/bin/lesspipe %s %s";
fi

export LESS_TERMCAP_mb="[35m" # magenta
export LESS_TERMCAP_md="[33m" # yellow
export LESS_TERMCAP_me="" # "0m"
export LESS_TERMCAP_se="" # "0m"
export LESS_TERMCAP_so="[34m" # blue
export LESS_TERMCAP_ue="" # "0m"
export LESS_TERMCAP_us="[4m"  # underline

################# dircolors ####################

if command -v dircolors &>/dev/null; then
  if test -r ~/.dircolors; then
    eval "$(dircolors -b ~/.dircolors)"
  else
    eval "$(dircolors -b)"
  fi
fi

################# aliases ####################

alias aliasrc='$EDITOR $HOME/.config/alias'

# Fast listing
alias ls="ls --color=auto"
alias la="ls -Alh"

# Make config changes easy in suckless programs
alias dwmrc='cd $HOME/.local/share/dwm && $EDITOR config.def.h'
alias i3rc='cd $HOME/.config/i3/ && $EDITOR config'
alias i3brc='cd $HOME/.config/i3blocks/ && $EDITOR config'
alias strc='cd $HOME/.local/share/st && $EDITOR config.def.h'
alias dmenurc='cd $HOME/.local/share/dmenu && $EDITOR config.def.h'
alias smci='sudo -A make clean install'

# Some useful aliases
alias prc='$EDITOR $HOME/.profile'
alias zrc='$EDITOR $HOME/.config/zsh/.zshrc'
alias ignore='$EDITOR $HOME/dotfiles/.gitignore'
alias vimrc='$EDITOR $HOME/.config/vim/vimrc'

# Actions
alias ps='sudo pacman -S'
alias pss='pacman -Ss'
alias ss='source ~/.config/zsh/.zshrc'
alias todo='$EDITOR $HOME/dox/personal/todo'
alias vi='$EDITOR'
alias drmi='docker rmi $(docker images -qa) -f'
alias drm='docker rm $(docker ps -qa)'
alias drma='docker rm $(docker ps -qa) && docker rmi $(docker images -qa) -f'
alias rmtex='rm -rf *.out *.aux *.log'
alias sts='$EDITOR ~/.config/nvim/plugin/shortcuts.vim'
alias xlx='xelatex -interaction nonstopmode -shell-escape'
alias mirrup='sudo reflector --verbose --country Russia --latest 5 --sort rate --save /etc/pacman.d/mirrorlist'
alias ?='duck'

# sxiv in thumbnail mode
alias iv='sxiv -t'

# sxiv in thumbnail mode search recursively
alias ivr='sxiv -rt'

# Git cmds
alias gs='git status'
alias gc='git commit -m'
alias gck='git checkout'
alias ga='git add'
alias gp='git push'

# Tmux shortcuts
alias tls='tmux list-sessions'
alias tks='tmux kill-session -t'
alias tas='tmux attach -t'
alias thnz='t hacking vim bash lynx docker'

# Local folders
alias hc='cd $HOME/.config'
alias hl='cd $HOME/.local'
alias hlb='cd $HOME/.local/bin'
alias hls='cd $HOME/.local/share'
alias hp='cd $HOME/pix'
alias hd='cd $HOME/dox'
alias hdr='cd $HOME/dox/repos'
alias hdw='cd $HOME/dwns'
alias zd='cd $HOME/.config/zsh'
alias dof='cd $HOME/dotfiles'
alias nir='cd $HOME/dox/nir'

# YouTube-DL
alias ydla='youtube-dl  --extract-audio --audio-format mp3 --output "%(title)s.%(ext)s"'
