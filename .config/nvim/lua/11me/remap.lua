vim.g.mapleader = " "

vim.keymap.set("n", "<esc>", function ()
    vim.cmd("nohlsearch")
end)
vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste over a selected word
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank into the system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- delete current buffer
vim.keymap.set("n", "<C-x>", function() vim.cmd("bd!") end)
-- move to the next buffer
vim.keymap.set("n", "<tab>", function() vim.cmd("bnext") end)
-- move to the previous buffer
vim.keymap.set("n", "<s-tab>", function() vim.cmd("bprev") end)

vim.keymap.set("n", "vrc", function()
    vim.cmd("e /home/lime/dotfiles/.config/nvim/lua/11me")
end)
-- Easily hit escape in terminal mode.
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
