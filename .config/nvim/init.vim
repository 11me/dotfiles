"  _   _         __     ___            ____             __ _
" | \ | | ___  __\ \   / (_)_ __ ___  / ___|___  _ __  / _(_) __ _
" |  \| |/ _ \/ _ \ \ / /| | '_ ` _ \| |   / _ \| '_ \| |_| |/ _` |
" | |\  |  __/ (_) \ V / | | | | | | | |__| (_) | | | |  _| | (_| |
" |_| \_|\___|\___/ \_/  |_|_| |_| |_|\____\___/|_| |_|_| |_|\__, |
"                                                            |___/
"
let mapleader = ","

" Plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'

call plug#end()

" Plugin mappings
map <c-n> :NERDTreeToggle<cr>


" Basics
syntax on
echom "Welcome to NeoVim"
set number relativenumber
set encoding=utf-8
highlight Normal ctermbg=Black
highlight NonText ctermbg=Black

" Insert mode
inoremap ( ()<esc>i
inoremap ' ''<esc>i
inoremap " ""<esc>i
inoremap { {}<esc>i
inoremap < <><esc>i
inoremap [ []<esc>i
iabbrev shb #!/bin/sh

" Normal mode
"  no maps yet

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e

" change the TAB charachter to → and END of line to ↲
set listchars=tab:→\ ,eol:↲
