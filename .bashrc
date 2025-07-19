export HISTCONTROL=ignoreboth
export HISTFILESIZE=10000
export HISTSIZE=10000
export HISTFILE="$HOME/.cache/.bash_history"
export CDPATH=".:~:~/repos"

case $- in
    *i*) ;;
      *) return;;
esac

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

shopt -s checkwinsize globstar complete_fullquote expand_aliases extquote\
 	 extglob force_fignore hostcomplete interactive_comments xpg_echo\
 	 promptvars sourcepath progcomp autocd cdspell dirspell direxpand\
 	 nocasematch histappend cmdhist lithist

################# options ####################
set -o vi

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
#pathprepend \
#  $SCRIPTS \
#  $PATHGO \
#  $HOME/.fnm \

pathprepend \
    $HOME/.local/scripts

pathappend \
  /usr/local/go/bin \
  /usr/local/bin \
  /usr/local/sbin \
  /usr/sbin \
  /usr/bin \
  /sbin \
  /bin

__prompt() {
  local_reset="\[\033[0m\]"
  local_black="\[\033[0;30m\]" # #212121
  local_red="\[\033[0;31m\]"   # #c61e5c
  local_green="\[\033[0;32m\]" # #81af24
  local_yellow="\[\033[0;33m\]" # #fd971f
  local_blue="\[\033[0;34m\]"  # #51aebe
  local_magenta="\[\033[0;35m\]" # #ae81ff
  local_cyan="\[\033[0;36m\]"  # #80beb5
  local_white="\[\033[0;37m\]" # #bababa

  # Git branch information
  local git_branch=""
  local current_branch
  current_branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ "$?" -eq 0 ] && [ "$current_branch" != "HEAD" ]; then
    git_branch="${local_blue}(${current_branch})${local_reset}"
  fi

  # Python virtual environment indicator
  local venv_indicator=""
  if [[ -n "$VIRTUAL_ENV" ]]; then
    # Extract just the name of the virtual environment
    local venv_name
    venv_name=$(basename "$VIRTUAL_ENV")
    venv_indicator="${local_green}(${venv_name})${local_reset}"
  fi

  PS1="${local_yellow}\w ${git_branch} ${venv_indicator}\n${local_blue}\$ ${local_reset}"
}

export PROMPT_COMMAND='__prompt'

################# pager ######################

if test -x /usr/bin/lesspipe; then
  export LESSOPEN="| /usr/bin/lesspipe %s";
  export LESSCLOSE="/usr/bin/lesspipe %s %s";
fi

export LESS_TERMCAP_so=$'\E[94;40m'
export LESS_TERMCAP_md=$'\E[33;40m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS="-R"

if command -v dircolors &>/dev/null; then
  if test -r ~/.dircolors; then
    eval "$(dircolors -b ~/.dircolors)"
  else
    eval "$(dircolors -b)"
  fi
fi

alias ls="ls -w 120 --color=auto"
alias la="ls -w 120 -Alh"

# Make ip command colorful
alias ip='ip -c'

# Actions
alias vi='$EDITOR'
alias ?='duck'

# Git cmds
alias gs='git status'

# YouTube-DL
alias ydla='youtube-dl  --extract-audio --audio-format mp3'

# work
[ -e ~/.bash_work ] && source ~/.bash_work
