vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    -- Telescope file browser
    use {
        'nvim-telescope/telescope-file-browser.nvim',
        requires = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/plenary.nvim'
        }
    }

    -- Post-install/update hook with neovim command
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required

            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
        }
    }

    use { 'lewis6991/gitsigns.nvim' }
    use { 'tpope/vim-fugitive' }
    use { 'blazkowolf/gruber-darker.nvim' }
    use { 'catppuccin/nvim', as = 'catppuccin' }
    use { 'rose-pine/neovim', as = "rose-pine" }
    use { 'folke/tokyonight.nvim', as = 'tokyonight' }

    use { 'ray-x/go.nvim',
        requires = {
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        }
    }
end)
