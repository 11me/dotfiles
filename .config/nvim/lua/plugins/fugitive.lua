return {
	"tpope/vim-fugitive",
	name = "fugitive",
	config = function()
        vim.keymap.set("n", "<leader>gs", function()
            vim.cmd("G")
            vim.cmd("only")
        end)
        vim.keymap.set("n", "gh", "<cmd>diffget //2<CR>")
        vim.keymap.set("n", "gl", "<cmd>diffget //3<CR>")
	end
}
