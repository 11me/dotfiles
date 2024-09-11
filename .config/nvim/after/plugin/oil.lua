require("oil").setup({
    columns = {
        "permissions",
        "size",
        "mtime",
    },
    skip_confirm_for_simple_edits = false,
    view_options = {
        show_hidden = true,
        is_always_hidden = function(name, bufnr)
            return vim.startswith(name, "..")
        end,
    },
    keymaps = {
        ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
    },
})
