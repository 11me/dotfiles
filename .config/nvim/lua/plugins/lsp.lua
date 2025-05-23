return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    ft = { "go", "lua", "python", "rust", "typescript", "javascript", "typescriptreact", "javascriptreact" },
    dependencies = {
      { "neovim/nvim-lspconfig" },
      {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        opts = {
          ui = {
            border = "rounded",
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      {
        "williamboman/mason-lspconfig.nvim",
        -- This plugin is now responsible for server installation
        opts = {
          -- A list of servers to automatically install if they're not already installed.
          -- This is the new way to handle what .ensure_installed() did.
          ensure_installed = {
            "gopls",
            "lua_ls",
            "pyright",
            "ts_ls",
          },
          -- You can also add handlers for specific servers if needed
          -- handlers = {
          --   lsp_zero.default_setup, -- Use lsp-zero's default handler for most servers
          --   lua_ls = function()
          --     -- Custom setup for lua_ls if needed
          --     local lspconfig = require("lspconfig")
          --     lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
          --   end,
          -- }
        },
      },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" }, -- For LSP source
      { "hrsh7th/cmp-buffer" }, -- For buffer source
      { "hrsh7th/cmp-path" }, -- For path source
      { "hrsh7th/cmp-cmdline" }, -- For command line source
      { "L3MON4D3/LuaSnip" }, -- Snippet engine
      { "saadparwaiz1/cmp_luasnip" }, -- Bridges nvim-cmp and LuaSnip
      { "hrsh7th/cmp-nvim-lua" }, -- If you need completion for Neovim Lua API
    },
    config = function()
      local lsp = require("lsp-zero")

      lsp.preset("recommended") -- This still sets up many good defaults

      -- [[ Configure LSP ]]
      -- This is where you'd put lsp.set_preferences or other lsp-zero specific settings
      -- that are still valid.
      lsp.set_preferences({
        sign_icons = {
          error = "E",
          warn = "W",
          hint = "H",
          info = "I",
        },
      })

      lsp.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false, silent = true }

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>lws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next({ float = { border = "rounded" } }) end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev({ float = { border = "rounded" } }) end, opts)
        vim.keymap.set("n", "<leader>lca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>lrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>lrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

        -- Formatting (optional)
        if client.supports_method("textDocument/formatting") then
          vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, opts)
          -- Or auto-format on save
          -- vim.api.nvim_create_autocmd("BufWritePre", {
          --   buffer = bufnr,
          --   callback = function() vim.lsp.buf.format({ async = false }) end
          -- })
        end
      end)

      -- Call lsp.setup() LAST. This is important for lsp-zero.
      -- It will set up nvim-lspconfig based on the preset and any modifications you've made.
      lsp.setup()

      -- Configure Neovim diagnostics (this is general Neovim config, not lsp-zero specific)
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always", -- Or "if_many"
        },
      })
    end,
  },

  -- Separate configuration for nvim-cmp, as lsp-zero no longer handles .setup_nvim_cmp()
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- Load nvim-cmp when you enter insert mode
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip") -- if you use LuaSnip

      -- Your custom mappings, previously in lsp.defaults.cmp_mappings
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      local cmp_mappings = {
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        --["<C-Space>"] = cmp.mapping.complete(),
        ['<C-x><C-o>'] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp_mappings,
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
          -- { name = "cmdline" } -- if you want cmdline suggestions too
        }),
        completion = {
          -- completeopt = "menu,menuone,noinsert", -- Example: more Vim-like completion
          -- autocomplete = true,
        },
        -- Optional: customize window appearance
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })
    end,
  },
}
