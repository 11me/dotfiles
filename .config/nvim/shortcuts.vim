" SHELL
autocmd FileType sh inoremap ;sh #!/bin/sh<cr><cr>
autocmd FileType sh inoremap ;case case<space><++><space>in<cr><++>)<cr><++><cr>;;<cr>esac<esc>4k0


" HTML
autocmd FileType html inoremap ;i <em></em><Space><++><Esc>FeT>i

" LaTeX


" Python
autocmd FileType python inoremap ;fin for<Space><++><Space>in<Space><++>:<cr><++><Esc>k0
autocmd FileType python inoremap ;_m if __name__<space>==<space>"__main__":<cr><++><esc>k0
autocmd FileType python inoremap ;fun def<space><++>(<++>):<cr><++><esc>k0
