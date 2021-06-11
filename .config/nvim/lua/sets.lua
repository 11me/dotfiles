local o = vim.o
local wo = vim.wo
local bo = vim.bo
local cmd = vim.cmd

o.hlsearch = false
o.hidden = true
o.errorbells = false
o.backup = false
o.writebackup = false
-- o.undodir = "~/.config/nvim/undodir"
o.termguicolors = true
o.incsearch = true
o.scrolloff = 10
o.clipboard = "unnamedplus"
o.updatetime = 300
o.showmode = true
o.completeopt = "menuone,noinsert,noselect"
o.cmdheight = 1
--o.guicursor = ''
o.showtabline = 0

wo.relativenumber = true
wo.number = true
wo.wrap = false
wo.signcolumn = "yes"
wo.colorcolumn = "80"

bo.tabstop = 2
bo.shiftwidth = 2
bo.softtabstop = 2
bo.expandtab = true
bo.smartindent = true
bo.swapfile = false

-- TODO
cmd('set undofile')
cmd('set shortmess+=c')
cmd('syntax on')
cmd([[set listchars=tab:→\ ,eol:↲,space:␣]])
cmd('filetype indent on') -- needs `ftplugin` folder
cmd([[set undodir=~/.config/nvim/undodir]])
cmd([[autocmd BufNewFile,BufRead *.wiki set filetype=wiki]])
--cmd('filetype plugin off')
--cmd('set omnifunc=')
