shopt -s checkwinsize globstar complete_fullquote expand_aliases extquote\
 	 extglob force_fignore hostcomplete interactive_comments xpg_echo\
 	 promptvars sourcepath progcomp autocd cdspell dirspell direxpand\
 	 nocasematch histappend cmdhist lithist

################# options ####################
set -o vi
if command -v xset >/dev/null; then
    xset r rate 300 50 # Speed xrate up
    xset -b            # Turn off awful beep sound
    xset s off -dpms   # Do not turn off the screen
fi


################# colors ####################

red='\[\e[31m\]'
green='\[\e[32m\]'
yellow='\[\e[33m\]'
blue='\[\e[34m\]'
magenta='\[\e[35m\]'
cyan='\[\e[36m\]'
white='\[\e[37m\]'
x='\[\e[0m\]' # reset


################# functions ####################

c() {
  printf "\e[H\e[2J"
} && export -f c

k() {
  kubectl "$@"
} && export -f k

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
  $PATHGO \
  $HOME/.fnm \
  $JAVA_HOME/bin \
  $BOB

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

  # git branch
  local B="$(git branch --show-current 2>/dev/null)"
  if test -n "$B"; then
    B=" ($B)"
  else
    B=""
  fi

  # python virtualenv
  local ENV=""
  if test -n "$VIRTUAL_ENV"; then
    ENV="(venv)"
  fi

  ps_minimal="${red}${yellow}\w${blue}$B ${yellow}$ENV\n${blue}\$${x} "
  ps_slim="${yellow}\w${blue}$B\n${blue}\u${white}@${cyan}\H${x}\$ "

  PS1="$ps_minimal"

}

export PROMPT_COMMAND='__prompt'

################# pager ######################

if test -x /usr/bin/lesspipe; then
  export LESSOPEN="| /usr/bin/lesspipe %s";
  export LESSCLOSE="/usr/bin/lesspipe %s %s";
fi

#export LESS_TERMCAP_mb="[35m" # magenta
#export LESS_TERMCAP_md="[33m" # yellow
#export LESS_TERMCAP_me="" # "0m"
#export LESS_TERMCAP_se="" # "0m"
#export LESS_TERMCAP_so="[34m" # blue
#export LESS_TERMCAP_ue="" # "0m"
#export LESS_TERMCAP_us="[4m"  # underline

################# dircolors ####################
if command -v dircolors &>/dev/null; then
  if test -r ~/.dircolors; then
    eval "$(dircolors -b ~/.dircolors)"
  else
    eval "$(dircolors -b)"
  fi
fi

# Fast listing
alias ls="ls --color=auto"
alias la="ls -Alh"

# Make ip command colorful
alias ip='ip -c'

# Actions
alias vi='$EDITOR'
alias ?='duck'

# Git cmds
alias gs='git status'

# YouTube-DL
alias ydla='youtube-dl  --extract-audio --audio-format mp3 --output "%(title)s.%(ext)s"'

# work
[ -e ~/.bash_work ] && source ~/.bash_work
