local center_list = require "telescope.themes".get_dropdown({
	winblend = 10,
	width = 0.5,
	prompt = " ",
	results_height = 15,
	previewer = false,
})
require('telescope').setup({
	defaults = {
		file_ignore_patterns = {
			".vscode",
			".git",
			"node_modules",
			"dist",
			"public",
			"build",

		},
		layout_config = {
			width = 0.9,
			height = 0.9,
			--preview_width = 0.35,
			horizontal = {
				width = {
					padding = 0.01,
				},
			},
			vertical = {
				preview_height = 0.75,
			},
		},
		--theme = center_list,
	},

	border = false,
	extensions = {
		file_browser = {
		},
	},
})

--require("telescope").load_extension("file_browser")
require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("notify")

require 'user.mapping.telescope-mapping';
