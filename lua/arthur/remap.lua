vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Edition
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move Selected up' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move Selected down' })
vim.keymap.set("n", "<C-§>", '<Plug>(comment_toggle_linewise_current)', { desc = 'Toggle comment with line comment' })
vim.keymap.set("v", "<C-§>", '<Plug>(comment_toggle_linewise_visual)', { desc = 'Toggle Comment line comment' })

-- Motion
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copy/Paste
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Other
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")

-- Tab management
vim.keymap.set("n", "<leader>ot", ":tabnew .<CR>")
vim.keymap.set("n", "<leader>ct", ":tabclose<CR>")
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>")
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>")

-- LSP
local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
end

-- Telescope
vim.keymap.set('n', '<leader><leader>', require('telescope.builtin').builtin, { desc = 'Display Telescope' })
vim.keymap.set('n', '<A-n>', require('telescope.builtin').live_grep, { desc = 'Search string in current workspace' })
vim.keymap.set('n', '<C-S-n>', require('telescope.builtin').find_files, { desc = 'Search Files' })
vim.keymap.set('n', '<C-S-g>', require('telescope.builtin').git_files, { desc = 'Search in git files' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'Search Help' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = 'Search current Word' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'Search in LSP errors/warning' })
vim.keymap.set('n', '<leader>sp', require('telescope').extensions.projects.projects, { desc = 'Search project' })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = 'Search project' })

-- Vim configuration
vim.keymap.set('n', '<leader>rc', ":source $MYVIMRC<CR>", { desc = "Reload config" })

-- Terminal
vim.keymap.set('t', '<C-§>', [[<C-\><C-n>]])

-- File Explorer
vim.keymap.set('n', '<A-1>', ':NvimTreeToggle<CR>')

-- Search and replace
vim.keymap.set('n', '<leader>sr', require('spectre').open, { desc = 'Search and replace' })
vim.keymap.set('n', '<leader>srf', require('spectre').open_file_search, { desc = 'Search and replace in current file' })

