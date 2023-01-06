local null_ls = require("null-ls")
local utils = require("null-ls.utils")

null_ls.setup({
    root_dir = utils.root_pattern("composer.json", "package.json", "Makefile", ".git"), -- Add composer
    -- Makes PHPCS errors more readeable
    diagnostics_format = "#{m} (#{c}) [#{s}]",
    sources = {
        -- You still need to execute `:set spell`
        null_ls.builtins.completion.spell,

        -- Add eslint to js projects
        null_ls.builtins.diagnostics.eslint,

        -- Change how the php linting will work
        null_ls.builtins.diagnostics.phpcs.with({
            prefer_local = "vendor/bin",
            diagnostic_config = {
                 virtual_text= true
            },
            extra_args = { "--standard=phpcs.xml" }
        }),

        -- You need to install stylua first: `brew install stylua`
        null_ls.builtins.formatting.stylua,
        --
        -- Use the local installation first
        null_ls.builtins.formatting.phpcbf.with({
            prefer_local = "vendor/bin",
        }),
    },
})
