local Remap = require("11me.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- delete current buffer
nmap("<C-x>", ":bd!<CR>")
-- move to the next buffer
nmap("<tab>", ":bnext<CR>")
-- move to the previous buffer
nmap("<s-tab>", ":bprev<CR>")
