"  _   _         __     ___            ____             __ _
" | \ | | ___  __\ \   / (_)_ __ ___  / ___|___  _ __  / _(_) __ _
" |  \| |/ _ \/ _ \ \ / /| | '_ ` _ \| |   / _ \| '_ \| |_| |/ _` |
" | |\  |  __/ (_) \ V / | | | | | | | |__| (_) | | | |  _| | (_| |
" |_| \_|\___|\___/ \_/  |_|_| |_| |_|\____\___/|_| |_|_| |_|\__, |
"                                                            |___/
"

let mapleader = ","
let g:airline_powerline_fonts=1
set nohlsearch
set clipboard+=unnamedplus
set smartindent
set number
set nowrap
set smartcase
set colorcolumn=80

" allows easily editing russian texts by switching to RU via ctrl+^
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Plugins
call plug#begin('~/.config/nvim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'chrisbra/Colorizer'
    Plug 'scrooloose/nerdtree'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'joshdick/onedark.vim'
    Plug 'sheerun/vim-polyglot'
call plug#end()

" Plugin mappings
map <c-n> :NERDTreeToggle<cr>
map <leader><f3> :ColorToggle<cr>
so ~/.config/nvim/coc-maps.vim

" Basics
syntax on
colorscheme onedark
filetype indent on
"highlight Normal ctermbg=Black
"highlight NonText ctermbg=Black
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
nnoremap <leader>s :setlocal spell! spelllang=ru_yo,en_us<cr>

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e
