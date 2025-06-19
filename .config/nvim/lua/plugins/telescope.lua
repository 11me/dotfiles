return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    cmd = "Telescope",
    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find Files (Telescope)",
      },
      {
        "<leader>rg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Live Grep (Telescope)",
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").git_files()
        end,
        desc = "Find Git Files (Telescope)",
      },
      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Find Buffers (Telescope)",
      },
      -- Add other useful Telescope pickers
      {
        "<leader>fh",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "Help Tags (Telescope)",
      },
      {
        "<leader>fo",
        function()
          require("telescope.builtin").oldfiles()
        end,
        desc = "Recent Files (Telescope)",
      },
      {
        "<leader>fk",
        function()
            require("telescope.builtin").keymaps()
        end,
        desc = "Keymaps (Telescope)",
      },
      {
        "<leader>fc",
        function()
            require("telescope.builtin").commands()
        end,
        desc = "Commands (Telescope)",
      },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          layout_strategy = "vertical",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            -- Configure other layout strategies as needed
          },
          sorting_strategy = "ascending",
          winblend = 0, -- Opacity of Telescope window
          border = {},
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }, -- Rounded border
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<Esc>"] = actions.close,
              -- You can add more insert mode mappings here
            },
            n = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<Esc>"] = actions.close,
              -- You can add normal mode mappings here (for results window)
            },
          },
          prompt_prefix = ">  ",
          -- selection_caret = "❯ ",
          -- path_display = { "truncate" },
        },
        pickers = {
          -- Configure individual pickers here if needed
          -- find_files = {
          --   theme = "dropdown",
          --   hidden = true, -- Show hidden files
          -- },
          -- live_grep = {
          --   theme = "dropdown",
          -- },
        },
        extensions = {
          -- Example for telescope-ui-select, if you install it
          -- ["ui-select"] = {
          --   require("telescope.themes").get_dropdown({}),
          -- },
          -- Example for fzf-native, if you install it
          -- fzf = {
          --   fuzzy = true,                    -- false will only do exact matching
          --   override_generic_sorter = true,  -- override the generic sorter
          --   override_file_sorter = true,     -- override the file sorter
          --   case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
          -- },
        },
      })

      -- To load extensions, if you have any (e.g., fzf, ui-select)
      -- Make sure these are also listed in dependencies if they are separate plugins
      -- pcall(telescope.load_extension, "fzf")
      -- pcall(telescope.load_extension, "ui-select")
    end,
  },
}
