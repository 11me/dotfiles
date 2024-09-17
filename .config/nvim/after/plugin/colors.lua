require('rose-pine').setup({
    styles = {
        bold = true,
        italic = true,
        transparency = true,
    },
})

vim.cmd.colorscheme('default')
vim.cmd [[hi Normal guibg=NONE ctermbg=NONE]]
