local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    -- vimgrep_arguments = {
    --   'rg',
    --   '--color=never',
    --   '--no-heading',
    --   '--with-filename',
    --   '--line-number',
    --   '--column',
    --   '--smart-case',
    -- },
    mappings = {
      -- remaps some globals
      i = {
        ["<C-b>"] = actions.move_selection_previous
      },
    },
    prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    file_ignore_patterns = {"node_modules", ".git"},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
  },
  extensions = {
    fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
    },
    media_files = {
    -- filetypes whitelist
    -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
        filetypes = {"png", "webp", "jpg", "jpeg", "mp4", "pdf"},
        find_cmd = "rg" -- find command (defaults to `fd`)
    },
  }
}

-- mappings
vim.cmd([[nnoremap <leader>ff :lua require('telescope.builtin').find_files{hidden = true}<cr>]])
vim.cmd([[nnoremap <leader>fe :lua require('telescope.builtin').file_browser{hidden = true}<cr>]])
vim.cmd([[nnoremap <leader>fg <cmd>Telescope live_grep<cr>]])
vim.cmd([[nnoremap <leader>fb <cmd>Telescope buffers<cr>]])
vim.cmd([[nnoremap <leader>fh <cmd>Telescope help_tags<cr>]])
vim.cmd([[nnoremap <leader>vrc :lua require('telescopeByTJ').search_dotfiles()<cr>]])

-- native fzf
require('telescope').load_extension('fzy_native')
-- media files preview
require('telescope').load_extension('media_files')

-- my module
local M = {}
M.search_dotfiles = function ()
  require('telescope.builtin').find_files({
    prompt_title = "<<-- VimRC -->>",
    cwd = "~/dotfiles/.config/nvim",
})
end

return M
