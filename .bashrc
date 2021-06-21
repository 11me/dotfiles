# If not running interactively, don't do anything
#[[ $- != *i* ]] && return


# shopt -s checkwinsize globstar complete_fullquote expand_aliases extquote\
# 	 extglob force_fignore hostcomplete interactive_comments xpg_echo\
# 	 promptvars sourcepath progcomp autocd cdspell dirspell direxpand\
# 	 nocasematch histappend cmdhist lithist

export HISTCONTROL='ignoreboth'
export HISTFILESIZE=0
export HISTSIZE=1000

__prompt() {

  PS1='\[\e[38;5;190m\w\]\e[0m
\[\e[38;5;45mλ\]\e[0m '
}

PROMPT_COMMAND='__prompt'

aliases="$HOME/.bash_aliases"
[ -f "$aliases" -a -r "$aliases" ] && . "$aliases"

funcs="$HOME/.bash_functions"
[ -f "$funcs" -a -r "$funcs" ] && . "$funcs"

unset aliases funcs
