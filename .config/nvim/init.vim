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
    Plug 'vim-airline/vim-airline'
    Plug 'scrooloose/nerdtree'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Plugin mappings
map <c-n> :NERDTreeToggle<cr>
so ~/.config/nvim/coc-maps.vim

" Basics
syntax on
filetype indent on
highlight Normal ctermbg=Black
highlight NonText ctermbg=Black
set number relativenumber
set encoding=utf-8
set hidden
set tabstop=4 softtabstop=0 shiftwidth=4 expandtab
set listchars=tab:→\ ,eol:↲,space:␣

" Insert mode
inoremap ( ()<esc>i
inoremap ' ''<esc>i
inoremap " ""<esc>i
inoremap { {}<esc>i
inoremap < <><esc>i
inoremap [ []<esc>i
iabbrev shb #!/bin/sh

" Normal mode
nnoremap <leader><f2> :set list!<cr>

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e
