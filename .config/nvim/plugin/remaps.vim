nnoremap <leader><f2> :set list!<cr>
nnoremap <leader>s :setlocal spell! spelllang=ru_yo,en_us<cr>
nnoremap <space><space> <esc>/<++><cr>"_c4l
nnoremap <c-s> :w<cr>
nnoremap <c-x> :bd!<cr>
nnoremap <tab> :bnext<cr>
nnoremap <s-tab> :bprevious<cr>

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

" Open exporer
nnoremap <silent> <C-n> :Lexplore<CR>:vertical resize -30<CR>

map <leader><f3> :ColorizerToggle<cr>

" Open corresponding .pdf/.html or preview
"map <leader>p :!opout <c-r>%<CR><CR>

" Compile document, be it groff/LaTeX/markdown/etc.
"map <leader>c :w! \| !compiler "<c-r>%"<CR>

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd VimLeave *.tex !cleartex %

" Filetypes
autocmd BufNewFile,BufRead Dockerfile* set filetype=dockerfile
autocmd BufNewFile,BufRead *.tex set filetype=tex
