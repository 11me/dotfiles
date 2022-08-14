local Remap = require("11me.keymap")
local nnoremap = Remap.nnoremap

--nnoremap("<C-p>", ":Telescope")
nnoremap("<leader>fs", function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)

nnoremap("<C-p>", function()
    require('telescope.builtin').git_files()
end)

nnoremap("<Leader>ff", function()
    require('telescope.builtin').find_files()
end)

nnoremap("<leader>rg", function()
  require('telescope.builtin').grep_string()
end)

nnoremap("<leader>fb", function()
    require('telescope.builtin').buffers()
end)

nnoremap("<leader>vrc", function()
    require('11me.telescope').search_dotfiles()
end)

nnoremap("<leader>fgo", function()
    require('11me.telescope').search_dir(os.getenv("GITOPS"))
end)

nnoremap("<leader>fjen", function()
    require('11me.telescope').search_dir(os.getenv("JENKINS"))
end)

