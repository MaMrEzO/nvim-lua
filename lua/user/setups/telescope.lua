local function filenameFirst(_, path)
	local tail = vim.fs.basename(path)
	local parent = vim.fs.dirname(path)
	if parent == "." then
		return tail
	end
	return string.format("%s\t\t%s", tail, parent)
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "TelescopeResults",
	callback = function(ctx)
		vim.api.nvim_buf_call(ctx.buf, function()
			vim.fn.matchadd("TelescopeParent", "\t\t.*$")
			vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
		end)
	end,
})
--local center_list = require "telescope.themes".get_dropdown({
--	winblend = 10,
--	width = 0.9,
--	prompt = " ",
--	results_height = 15,
--	previewer = false,
--})
require("telescope").setup({
	defaults = {
		--file_ignore_patterns = {
		--	"./.vscode",
		--	"./.git",
		--	"./node_modules",
		--	"./dist",
		--	"./public",
		--	"./build",

		--},
		layout_config = {
			width = 0.9,
			height = 0.9,
			--preview_width = 0.35,
			prompt_position = "top",
			horizontal = {
				width = {
					padding = 0.01,
				},
			},
			vertical = {
				preview_height = 0.75,
			},
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},
		color_devicons = true,
		sorting_strategy = "ascending",
		--sorting_strategy = "descending",
		--scroll_strategy = "limit",
		scroll_strategy = "cycle",
		--layout_config = {
		--	prompt_position = "top",
		--	height = 50,
		--	width = 180,
		--},
		--theme = center_list,
	},

	border = false,
	pickers = {
		current_buffer_fuzzy_find = {
			--theme = "dropdown",
		},
		git_status = { path_display = filenameFirst },
		find_files = { path_display = filenameFirst },
	},
	extensions = {
		file_browser = {},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})

require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("notify")
require("telescope").load_extension("file_browser")
--require('telescope').load_extension('fzf')

require("user.mapping.telescope-mapping")
