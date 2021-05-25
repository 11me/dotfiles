let mapleader = " "
syntax on
filetype indent on

" Install Vim-plug if is not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $VIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $VIMRC
\| endif

call plug#begin('~/.config/nvim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'chrisbra/Colorizer'
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'
  Plug 'honza/vim-snippets'
  Plug 'joshdick/onedark.vim'
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'sheerun/vim-polyglot'
  Plug 'mhinz/vim-signify'
  Plug 'liuchengxu/vim-which-key'
  Plug 'tpope/vim-fugitive'
  Plug 'puremourning/vimspector'
  Plug 'jiangmiao/auto-pairs'
  Plug 'preservim/nerdcommenter'
call plug#end()

"" Gruvbox colorscheme
"colorscheme gruvbox8_hard
"autocmd vimenter * ++nested colorscheme gruvbox8_hard
"" Make transparent background
"autocmd vimenter * ++nested highlight Normal guibg=NONE

let t:is_transparent = 0
function! ToggleTransparency()
    if t:is_transparent == 0
       let t:is_transparent = 1
       highlight Normal guibg=NONE
    else
        let t:is_tranparent = 0
        set background=dark
    endif
endfunction

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd VimLeave *.tex !cleartex %

nnoremap <leader><f2> :set list!<cr>
nnoremap <leader>s :setlocal spell! spelllang=ru_yo,en_us<cr>
nnoremap <space><space> <esc>/<++><cr>"_c4l
nnoremap <c-s> :w<cr>
nnoremap <c-x> :bd!<cr>
nnoremap <tab> :bnext<cr>
nnoremap <s-tab> :bprevious<cr>
"nnoremap <leader>v :set cursorline!<cr>

 " Move selected line / block of text in visual mode
 " shift + k to move up
 " shift + j to move down
  xnoremap K :move '<-2<CR>gv-gv
  xnoremap J :move '>+1<CR>gv-gv

" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>    :resize -2<CR>
nnoremap <silent> <M-k>    :resize +2<CR>
nnoremap <silent> <M-h>    :vertical resize -2<CR>
nnoremap <silent> <M-l>    :vertical resize +2<CR>

" Remap terminal exit to ctrl+q
tnoremap <C-q> <C-\><C-n>

" maps for coc
nnoremap <c-n> :CocCommand explorer<cr>

" maps for fzf plugin
nnoremap <c-p> :FZF<cr>
nnoremap <c-f> :Files<cr>

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
