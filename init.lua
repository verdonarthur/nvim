local nvimConfigPath = '~/.config/nvim/'

vim.cmd('source ' .. nvimConfigPath .. 'lua/core/plugins.lua')

-- Autoload plugins configuration/setup
local paths = vim.split(vim.fn.glob('~/.config/nvim/lua/plugins/**/*.lua'), '\n')
for _, file in pairs(paths) do
  vim.cmd('source ' .. file)
end

vim.cmd('source ' .. nvimConfigPath .. 'lua/core/globals.lua')
vim.cmd('source ' .. nvimConfigPath .. 'lua/core/mappings.lua')

