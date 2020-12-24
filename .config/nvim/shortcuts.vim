" SHELL
autocmd FileType sh inoremap :sh
            \ #!/bin/sh<cr><cr>

autocmd FileType sh inoremap :case
            \ case<space><++><space>in<cr><++>)
            \ <cr><++><cr>;;<cr>esac<esc>4k0


" HTML
autocmd FileType html inoremap :i
            \ <em></em><Space><++><Esc>FeT>i

" LaTeX
autocmd FileType tex inoremap :doc
            \ \begin{document}<esc>o<cr><++><cr><esc>o\end{document}<esc>4k

autocmd FileType tex inoremap :... \ldots

autocmd FileType tex inoremap :env
            \ \begin{<++>}<cr>\end{<++>}<esc>O<++><esc>k0


" Python
autocmd FileType python inoremap :fin
            \ for<Space><++><Space>in<Space><++>:<cr><++><Esc>k0

autocmd FileType python inoremap :_m
            \ if __name__<space>==<space>"__main__":<cr><++><esc>k0

autocmd FileType python inoremap :fun
            \ def<space><++>(<++>):<cr><++><esc>k0

" JavaScript
autocmd FileType javascript inoremap :fun
            \ function <++>(<++>){<cr><++><cr>}<esc>O<esc>2k0
