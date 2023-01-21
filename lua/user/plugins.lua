local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)





  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  use "kyazdani42/nvim-web-devicons" -- Icons for explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run=":TSUpdate",
  }

  -- Bufferline tabs
  use {
    "akinsho/bufferline.nvim",
  }

--   use({
--     "Pocco81/auto-save.nvim",
--     config = function()
--        require("auto-save").setup {
--         -- your config goes here
--         -- or just leave it empty :)
--        }
--     end,
--   })


  -- COLORSCHEMES
  use 'folke/tokyonight.nvim'
  use "flazz/vim-colorschemes"



  use {'ojroques/nvim-bufdel'}
  

  use "neoclide/coc.nvim"


  use "nvim-lua/completion-nvim"

  use "nvim-telescope/telescope.nvim"

  use "windwp/nvim-autopairs"

  use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
    require("toggleterm").setup()
  end}

  use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}








  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
