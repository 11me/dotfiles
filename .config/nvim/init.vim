let mapleader = " "
syntax on
filetype indent on

call plug#begin('~/.config/nvim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'chrisbra/Colorizer'
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'
  Plug 'honza/vim-snippets'
  Plug 'joshdick/onedark.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'sheerun/vim-polyglot'
call plug#end()

colorscheme onedark

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
nnoremap <space>j o<++><esc>0
nnoremap <space>J O<++><esc>0
nnoremap <c-s> :w<cr>
nnoremap <c-x> :bd!<cr>
nnoremap <tab> :bnext<cr>
nnoremap <s-tab> :bprevious<cr>
nnoremap <leader>v :set cursorline!<cr>
nnoremap <leader>b :call ToggleTransparency()<cr>

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
