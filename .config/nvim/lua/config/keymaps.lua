vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.guicursor = ""
vim.wo.cursorline = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.errorbells = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
--vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.spelllang = "en"
vim.opt.spell = true
vim.g.netrw_localrmdir = "rm -r"

vim.keymap.set("n", "<esc>", function()
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
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- delete current buffer
vim.keymap.set("n", "<C-x>", function() vim.cmd("bd!") end)
-- move to the next buffer
vim.keymap.set("n", "<tab>", function() vim.cmd("bnext") end)
-- move to the previous buffer
vim.keymap.set("n", "<s-tab>", function() vim.cmd("bprev") end)

-- Easily hit escape in terminal mode.
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local trim_whitespace_group = vim.api.nvim_create_augroup('TrimWhitespace', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
    group = trim_whitespace_group,
    pattern = '*', -- Apply to all file types
    callback = function()
        local view = vim.fn.winsaveview()
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.winrestview(view)
    end,
    desc = 'Trim trailing whitespace on save',
})


vim.api.nvim_create_augroup("BlackAutoFormat", {})
vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "*.py",
        group = "BlackAutoFormat",
        callback = function()
            local view = vim.fn.winsaveview()
            vim.cmd("silent !black --quiet %")
            vim.cmd("silent !isort --quiet %")
            vim.cmd("edit")
            vim.fn.winrestview(view)
        end,
    }
)
