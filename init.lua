require("config.lazy")

vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = false
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.cmdheight = 0
vim.opt.colorcolumn = '100'
vim.opt.wildmode = 'longest:full,full'
vim.o.bg='light'
vim.cmd.colorscheme 'gruvbox'

-- Map
vim.keymap.set('n', '<leader><leader>', require('telescope.builtin').builtin, { desc = 'Display Telescope' })
vim.keymap.set('n', '<C-N>', require('telescope.builtin').find_files, { desc = 'Search Files' })
vim.keymap.set('n', '<C-f>', require('telescope.builtin').live_grep, { desc = 'Search string in current workspace' })
