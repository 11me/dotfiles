alias aliasrc='$EDITOR $HOME/.config/alias'

# Fast listing
alias ls="ls --color=auto"
alias la="ls -Alh"
alias l="ls -l"

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
alias thnz='t hacking nvim zsh'

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