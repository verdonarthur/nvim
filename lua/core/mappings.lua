vim.g.mapleader = " "

-- File
-- -- save
vim.keymap.set("v", "<C-s>", ":w <CR>", { desc = 'save file' })

-- Edition
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move Selected up' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move Selected down' })
vim.keymap.set("n", "<leader>§", '<Plug>(comment_toggle_linewise_current)',
  { desc = 'Toggle comment with line comment' })
vim.keymap.set("v", "<leader>§", '<Plug>(comment_toggle_linewise_visual)', { desc = 'Toggle Comment line comment' })
vim.keymap.set('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = 'Show diagnostic' })
vim.keymap.set('v', '<leader>fb', vim.lsp.buf.format, { desc = 'Format Current Selection' })
vim.keymap.set('n', '<leader>fb', '<cmd>lua vim.lsp.buf.format()<CR>', { desc = 'Format Buffer' })

-- Motion
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- -- navigate within insert mode
vim.keymap.set("i", "<C-h>", "<left>")
vim.keymap.set("i", "<C-j>", "<down>")
vim.keymap.set("i", "<C-k>", "<up>")
vim.keymap.set("i", "<C-l>", "<right>")

-- Copy/Paste

-- Other
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")
vim.cmd [[
  let g:VM_maps = {}
  let g:VM_maps['Find Under']                  = '<C-m>'
  let g:VM_maps['Find Subword Under']          = '<C-m>'
]]

-- Tab management
vim.keymap.set("n", "<TAB>", "<Cmd>BufferLinePick<CR>", { desc = '' })
vim.keymap.set("n", "<C-TAB>", "<cmd>BufferLineCycleNext<CR>", { desc = 'Switch to Next buffer' })
vim.keymap.set("n", "<C-S-TAB>", "<cmd>BufferLineCyclePrev<CR>", { desc = 'Switch to Previous buffer' })

-- Telescope
vim.keymap.set('n', '<leader><leader>', require('telescope.builtin').builtin, { desc = 'Display Telescope' })
vim.keymap.set('n', '<leader>re', require('telescope.builtin').resume, { desc = 'Resume Telescope' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').live_grep, { desc = 'Search string in current workspace' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Search Files' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').git_files, { desc = 'Search in git files' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'Search Help' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = 'Search current Word' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'Search in LSP errors/warning' })
vim.keymap.set('n', '<leader>sp', require('telescope').extensions.projects.projects, { desc = 'Search project' })
vim.keymap.set('n', '<leader>so', require('telescope.builtin').oldfiles, { desc = 'Search Oldfiles' })
vim.keymap.set('n', '<leader>cs', require('telescope.builtin').colorscheme, { desc = 'Change colorscheme' })
vim.keymap.set('n', '<S-TAB>', require('telescope.builtin').buffers, { desc = 'Search buffers' })

-- Vim configuration
vim.keymap.set('n', '<leader>rc', ":source $MYVIMRC<CR>", { desc = "Reload config" })

-- Terminal
vim.keymap.set('t', '<A-ESC>', [[<C-\><C-n>]])
vim.keymap.set("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>",
  { noremap = true, silent = true, desc = "Open Lazygit" })

-- File Explorer
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>e', ':NvimTreeFocus<CR>')

-- Search and replace
vim.keymap.set('n', '<leader>sr', require('spectre').open, { desc = 'Search and replace' })
vim.keymap.set('n', '<leader>srf', require('spectre').open_file_search, { desc = 'Search and replace in current file' })
