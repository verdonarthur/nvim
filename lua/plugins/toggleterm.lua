local Terminal  = require('toggleterm.terminal').Terminal

require("toggleterm").setup({
  open_mapping = '<A-t>',
  direction = 'horizontal',
  size=20,
})

-- Lazygit Terminal
local lazygit = Terminal:new({ 
  cmd = "lazygit", 
  count = 5,
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

