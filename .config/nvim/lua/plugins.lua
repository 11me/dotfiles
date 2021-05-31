local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end


--- Check if a file or directory exists in this path
local function require_plugin(plugin)

    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"
    local plugin_path = plugin_prefix .. plugin .. "/"
    local ok, err, code = os.rename(plugin_path, plugin_path)

    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then
        vim.cmd("packadd " .. plugin)
    end
    return ok, err, code
end


-- Auto compile when there are changes in plugins.lua
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"

local packer = require('packer')
local use = packer.use

return packer.startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- set of plugins
  use {"neovim/nvim-lspconfig", opt = true}
  use {"hrsh7th/nvim-compe", opt = true}
  use {"gruvbox-community/gruvbox", opt = true}
  use {"glepnir/lspsaga.nvim", opt = true}
  use {"kabouzeid/nvim-lspinstall", opt = true}
  use {"windwp/nvim-autopairs", opt = true}
  use {"hrsh7th/vim-vsnip", opt = true}
  use "rafamadriz/friendly-snippets"
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'}
    }
}
  use {"nvim-telescope/telescope-fzy-native.nvim", opt = true}
  use {"windwp/nvim-ts-autotag", opt = true}
  use {'norcalli/nvim-colorizer.lua'}
  use {'terrortylor/nvim-comment', opt = true}
  use {'nvim-telescope/telescope-media-files.nvim', opt = true}

  use {'vimwiki/vimwiki', opt = true}

  use {'sbdchd/neoformat', opt = true}
  use {'airblade/vim-gitgutter', opt = true}

  -- plugins shoudl be required
  require_plugin('nvim-lspconfig')
  require_plugin('nvim-compe')
  require_plugin('lspsaga.nvim')
  require_plugin('nvim-lspinstall')
  require_plugin('nvim-autopairs')
  require_plugin('nvim-treesitter')
  require_plugin('vim-vsnip')
  require_plugin('friendly-snippet')
  require_plugin('telescope.nvim')
  require_plugin('popup.nvim')
  require_plugin('plenary.nvim')
  require_plugin('nvim-ts-autotag')
  require_plugin('nvim-colorizer.lua')
  require_plugin('nvim-comment')
  require_plugin('telescope-fzy-native.nvim')
  require_plugin('telescope-media-files.nvim')
  require_plugin('vimwiki')
  require_plugin('neoformat')
  require_plugin('vim-gitgutter')

end)
