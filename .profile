if [[ "$TERM" != "screen" ]]; then
  export TERM=screen-256color
fi
export HISTCONTROL='ignoreboth'
export HISTFILESIZE=10000
export HISTSIZE=10000
export HISTFILE="$HOME/.cache/.bash_history"
export CDPATH=".:~:~/dox:~/dox/projects:~/dox/books"
export SCRIPTS="$HOME/.local/bin"

# Default programms
export EDITOR="nvim"
export TERMINAL="st"
export FILEMANAGER="lf"
export BROWSER="firefox"
export WM="i3"
export STATUSBAR="i3blocks"
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export SUDO_PROMPT="password 🔑:"
export JAVA_HOME="/usr/lib/jvm/java-15-openjdk"

# Clean up
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export ZDOTDIR="$HOME/.config/zsh"

export GOMAXPROCS="$(nproc)"
export PATHGO="/usr/local/go/bin"
export LYNX_CFG="$HOME/.config/lynx/lynx.cfg"
export BOB="$HOME/.local/share/bob/nvim-bin"

#This file runs on login
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

export LF_ICONS="di=📁:\
fi=📃:\
tw=🤝:\
ow=📂:\
ln=⛓:\
or=❌:\
ex=🎯:\
*.txt=✍:\
*.mom=✍:\
*.me=✍:\
*.ms=✍:\
*.png=🖼:\
*.ico=🖼:\
*.jpg=📸:\
*.jpeg=📸:\
*.gif=🖼:\
*.svg=🗺:\
*.xcf=🖌:\
*.html=🌎:\
*.xml=📰:\
*.gpg=🔒:\
*.css=🎨:\
*.pdf=📚:\
*.djvu=📚:\
*.epub=📚:\
*.csv=📓:\
*.xlsx=📓:\
*.tex=📜:\
*.md=📘:\
*.r=📊:\
*.R=📊:\
*.rmd=📊:\
*.Rmd=📊:\
*.mp3=🎵:\
*.opus=🎵:\
*.ogg=🎵:\
*.m4a=🎵:\
*.flac=🎼:\
*.mkv=🎥:\
*.mp4=🎥:\
*.webm=🎥:\
*.mpeg=🎥:\
*.avi=🎥:\
*.zip=📦:\
*.rar=📦:\
*.7z=📦:\
*.tar.gz=📦:\
*.z64=🎮:\
*.v64=🎮:\
*.n64=🎮:\
*.1=ℹ:\
*.nfo=ℹ:\
*.info=ℹ:\
*.log=📙:\
*.iso=📀:\
*.img=📀:\
*.bib=🎓:\
*.ged=👪:\
*.part=💔:\
*.torrent=🔽:\
"

# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
