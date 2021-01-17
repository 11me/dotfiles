let mapleader = " "
syntax on
filetype indent on

call plug#begin('~/.config/nvim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chrisbra/Colorizer'
Plug 'junegunn/fzf.vim'
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd VimLeave *.tex !cleartex %

nnoremap <leader><f2> :set list!<cr>
nnoremap <leader>s :setlocal spell! spelllang=ru_yo,en_us<cr>
nnoremap <space><space> <esc>/<++><cr>"_c4l
nnoremap <space>j o<++><esc>0
nnoremap <space>J O<++><esc>0
nnoremap <c-s> :w<cr>
"
" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <leader><f3> :ColorToggle<cr>

" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler "<c-r>%"<CR>

" Filetypes
autocmd BufNewFile,BufRead Dockerfile* set filetype=dockerfile
autocmd BufNewFile,BufRead *.tex set filetype=tex
