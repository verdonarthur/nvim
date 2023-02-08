local telescope = require('telescope')

local globPattern = '!**/{.git,node_modules,vendor}/*'

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob",
			globPattern
		},

		prompt_prefix = "   ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",

		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},

		path_display = { "shorten" },
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" },
	},

	pickers = {
		colorscheme = {
			enable_preview = true,
			theme = "dropdown",
		},
		find_files = {
			find_command = { "rg", "--files", "--hidden", "--no-ignore-vcs", "--glob", globPattern },
		},
		diagnostics = {
			theme = "ivy",
			previewer = false,
		},
		buffers = {
			previewer = false,
			layout_config = {
				width = 80,
			},
		},
		oldfiles = {
			prompt_title = 'History',
		},
		lsp_references = {
			previewer = false,
		},
	},

	extensions = {
		fzf = {
		  fuzzy = true,                    -- false will only do exact matching
		  override_generic_sorter = true,  -- override the generic sorter
		  override_file_sorter = true,     -- override the file sorter
		  case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
		}
	}
})

require('telescope').load_extension('projects')
require('telescope').load_extension('fzf')
