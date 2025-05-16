return {
  {
    "stevearc/oil.nvim",
    version = "v2.15.0",
    dependencies = {
    },
    event = "VimEnter",
    cmd = "Oil",
    keys = {
      {
        "<leader>e",
        function()
          require("oil").open()
        end,
        desc = "Open Oil file explorer",
      },
    },
    -- The 'opts' table will be passed to oil.setup()
    -- by the config function below.
    opts = {
      -- 'icon' column has been removed
      columns = {
        "permissions",
        "size",
        "mtime",
      },
      -- Your preference for skipping confirmation
      skip_confirm_for_simple_edits = false,

      -- Your view options
      view_options = {
        show_hidden = true,
        -- This function determines which files are *always* hidden in the view.
        -- Your original function hides files starting with ".." (like parent directory links in some views)
        is_always_hidden = function(name, bufnr)
          -- You might want to hide other common system/config files as well, e.g.:
          -- return name == "." or name == ".." or name == ".git" or name == ".DS_Store"
          return vim.startswith(name, "..") -- Hides ".."
        end,
      },

      -- Keymaps for the Oil buffer
      keymaps = {
        -- Your custom keymap for vertical split
        ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },

        -- Some other common and useful keymaps (feel free to customize or remove)
        ["<C-h>"] = { "actions.select_split", opts = { horizontal = true }, desc = "Open in horizontal split" },
        ["<C-t>"] = { "actions.select_tab", desc = "Open in new tab" },
        ["<C-p>"] = { "actions.preview", desc = "Preview file" },
        ["<C-c>"] = { "actions.close", desc = "Close Oil" },
        ["<C-l>"] = { "actions.refresh", desc = "Refresh" },
        ["-"] = { "actions.parent", desc = "Go to parent directory" },
        ["_"] = { "actions.open_cwd", desc = "Open Oil in current working directory" }, -- This action opens a new oil buffer at the CWD
        ["`"] = { "actions.cd", desc = "Change Neovim's CWD to this directory" },
        -- The tilde keymap to open home directory is now defined in the global `keys` table above for LazyVim
        ["g?"] = { "actions.show_help", desc = "Show help" },
        ["g."] = { "actions.toggle_hidden", desc = "Toggle hidden files" }, -- Useful with show_hidden = true
      },

      default_file_explorer = true,
      win_options = {
        -- This is how you can pass options to nvim_open_win
        -- For example, to disable winblend for oil:
        -- winblend = 0,
      },
      -- Add other oil.nvim options here as needed
      -- For example, to change the floating preview window border:
      -- float_preview_win_options = {
      --   border = "rounded",
      -- },
    },
    config = function(_, opts)
      -- Pass the 'opts' table directly to oil's setup function
      require("oil").setup(opts)
    end,
  },
}

