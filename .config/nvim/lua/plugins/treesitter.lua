return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = "v0.9.3",
    build = ":TSUpdate", -- Command to update parsers
    event = { "BufReadPost", "BufNewFile" }, -- Load on opening a file or creating a new one
    dependencies = {},
    config = function()
      local treesitter_config = require("nvim-treesitter.configs")

      treesitter_config.setup({
        -- A list of parser names, or "all" (takes longer to install)
        -- :TSInstallInfo will show available parsers
        ensure_installed = {
          "c",
          "cpp",
          "go",
          "lua",
          "python",
          "rust",
          "javascript",
          "typescript",
          "tsx",
          "html",
          "css",
          "json",
          "yaml",
          "toml",
          "bash",
          "markdown",
          "markdown_inline", -- For markdown code blocks
          "vim",
          "vimdoc",
          "query",
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you manage parsers manually with :TSInstall
        auto_install = true,

        -- List of parsers to ignore installing (for "all")
        ignore_install = { "phpdoc" }, -- Example

        -- Main modules and their configurations
        highlight = {
          enable = true, -- Enable syntax highlighting
          -- Or disable for large files to prevent performance issues
          -- disable = function(lang, buf)
          --     local max_filesize = 100 * 1024 -- 100 KB
          --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          --     if ok and stats and stats.size > max_filesize then
          --         return true
          --     end
          -- end,

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (e.g. for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },

        indent = {
          enable = true, -- Enable indentation based on Treesitter
          -- disable = { "python" } -- Example: disable for Python if you prefer its native indent
        },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>", -- Or use something like "gnn"
            node_incremental = "<C-space>", -- Or "<CR>" / "<Tab>"
            scope_incremental = "<nop>", -- Or "gcn"
            node_decremental = "<bs>",    -- Or "<S-Tab>"
          },
        },

      })
    end,
  },
}

