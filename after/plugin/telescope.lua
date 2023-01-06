local telescope = require("telescope")
local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--no-ignore")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

telescope.setup({
  defaults = {
		vimgrep_arguments = vimgrep_arguments,
	},
  pickers = {
    colorscheme = {
      enable_preview = true,
      theme = "dropdown",
    },
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--no-ignore", "--glob", "!**/.git/*" },
    },
  }
})

require('telescope').load_extension('projects')
