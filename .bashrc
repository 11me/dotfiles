# shopt -s checkwinsize globstar complete_fullquote expand_aliases extquote\
# 	 extglob force_fignore hostcomplete interactive_comments xpg_echo\
# 	 promptvars sourcepath progcomp autocd cdspell dirspell direxpand\
# 	 nocasematch histappend cmdhist lithist

# exports

export HISTCONTROL='ignoreboth'
export HISTFILESIZE=1000
export HISTSIZE=1000
export HISTFILE="$HOME/.cache/.bash_history"
export CDPATH=".:~:~/dox:~/dox/projects:~/dox/books"
export SCRIPTS="$HOME/.local/bin"

################# functions ####################

c() {
  clear
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

################# prompt ####################

__prompt() {

  PS1='\[\e[38;5;190m\w\]\n\e[0m\[\e[38;5;45mλ\]\e[0m '

}

export PROMPT_COMMAND='__prompt'


################# aliases ####################

alias aliasrc='$EDITOR $HOME/.config/alias'

# Fast listing
alias ls="ls -lh --color=auto"
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
alias vimrc='$EDITOR $HOME/.config/nvim/init.vim'

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
alias thnz='t hacking nvim shell'

# Local folders
alias hc='cd $HOME/.config'
alias hl='cd $HOME/.local'
alias hlb='cd $HOME/.local/bin'
alias hls='cd $HOME/.local/share'
alias hp='cd $HOME/pix'
alias hd='cd $HOME/dox'
alias hdp='cd $HOME/dox/projects'
alias hdw='cd $HOME/dwns'
alias zd='cd $HOME/.config/zsh'
alias dof='cd $HOME/dotfiles'
alias nir='cd $HOME/dox/nir'

# YouTube-DL
alias ydla='youtube-dl  --extract-audio --audio-format mp3 --output "%(title)s.%(ext)s"'
