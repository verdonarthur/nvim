-- Auto install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

-- Plugins install
return require('packer').startup(function(use)
  -- Plugin management
  use 'wbthomason/packer.nvim'

  -- General purpose
  use 'nvim-lua/plenary.nvim'
  use 'tpope/vim-sleuth'
  use 'editorconfig/editorconfig-vim'

  -- Better tabs
  use {'akinsho/bufferline.nvim', wants = 'nvim-web-devicons'}

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0'
  }

  -- Language coloration syntaxic
  use 'nvim-treesitter/nvim-treesitter'

  -- All LSP (Language Server Protocol) related plugins
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },

      -- Statusline
      { 'nvim-lua/lsp-status.nvim' }
    }
  }

  -- Linting
  use({ -- Null-LS Use external formatters and linters
      "jose-elias-alvarez/null-ls.nvim",
      requires = {
          "nvim-lua/plenary.nvim",
      },
  })

  -- File Manager
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }

  -- Session Manager
  use {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Downloads", "/"},
        auto_session_root_dir = "~/.vim/sessions/",
      }
    end
  }

  -- Terminal in nvim
  use { 'akinsho/toggleterm.nvim', tag = '*' }

  -- Better marks
  use 'chentoast/marks.nvim'

  -- Plugin for edition
  use({ 'tpope/vim-surround' })
  use 'windwp/nvim-spectre'
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup {
      }
    end
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use({ "folke/which-key.nvim" })
  use({ 'mg979/vim-visual-multi' })

  -- Auto save
  use({ 'pocco81/auto-save.nvim' })

  -- Project management
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        manual_mode = true,
      }
    end
  }

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Theming
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "folke/tokyonight.nvim", as = "tokyonight" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


