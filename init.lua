require('core.globals')
require('core.mappings')
require('core.plugins')

-- Autoload plugins configuration/setup
local paths = vim.split(vim.fn.glob('~/.config/nvim/lua/plugins/**/*.lua'), '\n')

for _, file in pairs(paths) do
  vim.cmd('source ' .. file)
end

