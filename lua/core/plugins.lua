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
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Language coloration syntaxic
  use 'nvim-treesitter/nvim-treesitter'

  -- All LSP (Language Server Protocol) related plugins
  use {
    'neovim/nvim-lspconfig',
    requires = {
      -- LSP Support
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind-nvim',

      -- Statusline
      'nvim-lua/lsp-status.nvim'
    }
  }

  -- Linting
  use({ -- Null-LS Use external formatters and linters
      'jose-elias-alvarez/null-ls.nvim',
      requires = {
          'nvim-lua/plenary.nvim',
      },
  })

  -- Git integration
  use ({
    'lewis6991/gitsigns.nvim',
  })

  -- File Manager
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }

  -- Terminal in nvim
  use { 'akinsho/toggleterm.nvim', tag = '*' }

  -- Better marks
  use 'chentoast/marks.nvim'

  -- Plugin for edition
  use({ 'tpope/vim-surround' })

  use({ 'tpope/vim-repeat' })

  use({ 'nelstrom/vim-visual-star-search' })

  use({
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
  })

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

  use {
      'goolord/alpha-nvim',
      config = function ()
          require'alpha'.setup(require'alpha.themes.startify'.config)
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
  use { "sonph/onehalf", as = "onehalf", rtp='vim',
    config = function()
      vim.cmd[[colorscheme onehalflight]]
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


