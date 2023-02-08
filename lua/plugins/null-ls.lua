local null_ls = require('null-ls')
local utils = require('null-ls.utils')

null_ls.setup({
  root_dir = utils.root_pattern("composer.json", "package.json", "Makefile", ".git"),

  -- Makes PHPCS errors more readeable
  diagnostics_format = "#{m} (#{c}) [#{s}]",

  sources = {
    -- Change how the php linting will work
    null_ls.builtins.diagnostics.phpcs.with({
        prefer_local = "vendor/bin",
        diagnostic_config = {
             virtual_text= false
        },
        extra_args = { "--standard=phpcs.xml" }
    }),
    null_ls.builtins.diagnostics.eslint_d ,
    null_ls.builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),
    -- null_ls.builtins.diagnostics.phpstan,

    -- Use the local installation first
    null_ls.builtins.formatting.phpcbf.with({
        prefer_local = "vendor/bin",
    }),
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.phpcsfixer,
    null_ls.builtins.formatting.eslint_d,

    null_ls.builtins.code_actions.eslint_d
  }
})

