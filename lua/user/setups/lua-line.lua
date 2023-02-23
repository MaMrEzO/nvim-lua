local navic = require("nvim-navic")
local colors = {
	blue  = '#80a0ff',
	cyan  = '#79dac8',
	black = '#232324',
	white = '#c6c6c6',
	red   = '#ff5189',
	orang = '#cd7832',
	grey  = '#131313',
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.orang },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.white, bg = colors.black },
	},

	insert = { a = { fg = colors.black, bg = colors.blue } },
	visual = { a = { fg = colors.black, bg = colors.cyan } },
	replace = { a = { fg = colors.black, bg = colors.red } },

	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.black, bg = colors.black },
	},
}

local branch = {
	'branch',
	icon = "",
}

local filename = {
	'filename',
	on_click = function()
		vim.cmd('NvimTreeFindFile')
	end,
}

local diagnonistics = {
	'diagnostics',

	-- Table of diagnostic sources, available sources are:
	--   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
	-- or a function that returns a table as such:
	--   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
	sources = { 'nvim_diagnostic', 'coc' },

	-- Displays diagnostics for the defined severity types
	sections = { 'error', 'warn', 'info', 'hint' },

	diagnostics_color = {
		-- Same values as the general color option can be used here.
		error = 'DiagnosticError', -- Changes diagnostics' error color.
		warn  = 'DiagnosticWarn', -- Changes diagnostics' warn color.
		info  = 'DiagnosticInfo', -- Changes diagnostics' info color.
		hint  = 'DiagnosticHint', -- Changes diagnostics' hint color.
	},
	--symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
	colored = true, -- Displays diagnostics status in color if set to true.
	update_in_insert = false, -- Update diagnostics in insert mode.
	always_visible = false, -- Show diagnostics even if there are none.
	on_click = function()
		vim.cmd('Telescope diagnostics bufnr=0')
		--vim.diagnostic.setqflist()
	end
}

local diff = {
	'diff',

	colored = true,
	diff_color = {
		added    = { fg = "#28A745" },
		modified = { fg = "#DBAB09" },
		removed  = { fg = "#D73A49" }
	},
	symbols = {
		added    = " ",
		modified = " ",
		removed  = " "
	},
	on_click = function()
		vim.cmd('tabnew')
		vim.cmd('G')
	end

}

require('lualine').setup {
	options = {
		icons_enabled = true,
		--theme = 'gruvbox-material',
		--theme = 'nightfly',
		--theme = 'dracula',
		--theme = 'codedark',
		--theme = 'palenight',--shades of purpule
		--component_separators = { left = '', right = '' },
		--section_separators = { left = '', right = '' },
		theme = bubbles_theme,
		component_separators = '|',
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = { "NvimTree", "Outline" },
			winbar = { "NvimTree", "Outline", "Scratch", "Noice", "nui" },
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = {
			{ 'mode', separator = { left = '' }, right_padding = 2 },
		},
		lualine_b = { branch, diff, filename },
		lualine_c = {
			diagnonistics,
		},
		lualine_x = {},
		lualine_y = { 'encoding', 'fileformat', 'filetype', 'progress' },
		lualine_z = {
			{ 'location', separator = { right = '' }, left_padding = 1 },
		}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = { 'filename' },
		lualine_z = {}
	},
	tabline = {},
	winbar = {
		lualine_a = {},
		lualine_b = { { 'filename', separator = { left = '' }, right_padding = 2 }, },
		lualine_c = {
			{ navic.get_location, cond = navic.is_available, separator = { right = '' }, left_padding = 2 },
		},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { { 'tabs', mode = 2 } }
	},
	inactive_winbar = {
		lualine_a = { 'filename' },
	},
	extensions = {}
}
