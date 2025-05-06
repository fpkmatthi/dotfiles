local fn = vim.fn

-- auto install packer

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  }
  print "Installing packer, close + reopen nvim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads nvim after saving plugins.lua
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on the first use
-- local packer = require('packer')
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

-- Install plugins here
return packer.startup(function(use)
  -- general
  use "wbthomason/packer.nvim"      -- have packer manage itself
  use "nvim-lua/popup.nvim"         -- lua impl. of popup api from nvim
  use "nvim-lua/plenary.nvim"       -- useful lua functions

  -- Tree
  use "nvim-tree/nvim-web-devicons"
  use "nvim-tree/nvim-tree.lua"

  -- motion
  use "easymotion/vim-easymotion"   -- easy motion
  use "tpope/vim-commentary"        -- comment stuff (gcc)
  use "tpope/vim-surround"          -- surround stuff
  use {                             -- auto pairs () {} []
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
  }
  use {
    'andymass/vim-matchup',
    setup = function()
      -- may set any options here
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  }

  -- syntax
  use "kovetskiy/sxhkd-vim"         -- sxhkd syntax
  use "rose-pine/neovim"            -- rose pine theme
  -- use "mrcjkb/rustaceanvim"

  -- cmp
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use 'saadparwaiz1/cmp_luasnip'

  -- snippets
  use 'L3MON4D3/LuaSnip'
  -- use "rafamadriz/friendly-snippets"

  -- nvim-lspconfig
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim" -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer


  -- Telescope
  use "BurntSushi/ripgrep"
  use "sharkdp/fd"
  use {
    "nvim-telescope/telescope.nvim",
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-media-files.nvim'
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "HiPhish/rainbow-delimiters.nvim"
  -- use "nvim-treesitter/playground"


  -- Line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- auto set up config after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
