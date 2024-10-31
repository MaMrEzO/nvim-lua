local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 0, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 2, -- so that ``` is visible in markdown files
	-- colorcolumn = "80",
	-- colorcolumn = "120",
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	--mouse = "a",            -- allow the mouse to be used in neovim
	mousemodel = "extend",
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 0, -- always show tabs
	smartcase = true, -- smart case
	smartindent = false, -- make indenting smarter again
	splitbelow = false, -- force all horizontal splits to go below current window
	splitright = false, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	laststatus = 0,
	showcmd = false,
	ruler = false,
	relativenumber = true, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	--scrolloff = 8,             --
	--sidescrolloff = 8,
	guifont = "monospace:h17", -- the font used in graphical neovim applications
}
vim.cmd("set noarabicshape")
vim.cmd("set noarabic")
vim.cmd("set termbidi")

vim.o.mouse = "a"
vim.o.fillchars = "vert:▏,eob: ,fold: ,foldopen:,foldsep: ,foldclose:"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--vim.o.foldcolumn = "0" -- '0' is not bad
--vim.o.foldlevel = 1 -- Using ufo provider need a large value, feel free to decrease the value
--vim.o.foldlevelstart = 99
--vim.o.foldenable = true

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work

vim.filetype.add({
	extension = {
		conf = "dosini",
	},
})

--vim.cmd('colorscheme shades_of_purple')
----Shade of purple customization's
--vim.cmd('hi LineNr ctermfg=140 ctermbg=235 guifg=#a599e9 guibg=#2d2b55')
--vim.cmd('hi VertSplit ctermfg=140 ctermbg=235 guifg=#302e54 guibg=#2d2b55')
----hi WinSeparator guifg=#ff0000
----vim.cmd('hi WinSeparator guifg=#00aaff guibg=#2d2b55')
--vim.cmd('hi SignColumn ctermfg=140 ctermbg=235 guifg=#a599e9 guibg=#2d2b55')
----

---- Normal        xxx guifg=#ced1d4 guibg=#262627
---- NormalNC      xxx guifg=#ced1d4 guibg=#232324
--vim.cmd("colorscheme darcula-solid")
--vim.cmd('hi Normal guifg=#ced1d4 guibg=#232324')
--vim.cmd('hi NormalNC guifg=#ced1d4 guibg=#232324')

--vim.cmd("colorscheme material-deep-ocean")

--      Extra
--vim.cmd("hi! link Type Structure")
--vim.cmd("hi! link @property Structure")
--vim.cmd("hi! link @variable.builtin Keyword")
--vim.cmd("hi! link @constructor @tag")
--vim.cmd("hi! LspInlayHint guifg=#aaaa00 guibg=#4d4d4d")
--vim.cmd("hi! Statement guifg=#cd7832 gui=italic")
--vim.cmd("hi CursorLine guibg=Grey10")
--vim.cmd("hi Visual guibg=Grey30")
--      Extra

--CursorLine    xxx cterm=underline guibg=Grey40

----vim.cmd('let g:vim_markdown_conceal = 1')
----vim.cmd('let g:vim_markdown_conceal_code_blocks = 1')
--
--vim.cmd('colorscheme dracula')
--require("github-theme").setup({
--	options = {
--		-- Compiled file's destination location
--		compile_path = vim.fn.stdpath("cache") .. "/github-theme",
--		compile_file_suffix = "_compiled", -- Compiled file suffix
--		hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
--		hide_nc_statusline = true, -- Override the underline style for non-active statuslines
--		transparent = false, -- Disable setting background
--		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
--		dim_inactive = false, -- Non focused panes set to alternative background
--		module_default = true, -- Default enable value for modules
--		styles = { -- Style to be applied to different syntax groups
--			comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
--			functions = "NONE",
--			keywords = "NONE",
--			variables = "NONE",
--			conditionals = "NONE",
--			constants = "NONE",
--			numbers = "NONE",
--			operators = "NONE",
--			strings = "NONE",
--			types = "NONE",
--		},
--		inverse = { -- Inverse highlight for different types
--			match_paren = false,
--			visual = false,
--			search = false,
--		},
--		darken = { -- Darken floating windows and sidebar-like windows
--			floats = false,
--			sidebars = {
--				enabled = true,
--				list = {}, -- Apply dark background to specific windows
--			},
--		},
--		modules = { -- List of various plugins and additional options
--			-- ...
--		},
--	},
--	palettes = {},
--	specs = {},
--	groups = {},
--})

-- setup must be called before loading
--vim.cmd("colorscheme github_dark")
-- setup must be called before loading
--vim.cmd('colorscheme github_dark_colorblind')
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
--vim.cmd('hi NormalNC guifg=#ced1d4 guibg=#232324')

--require("catppuccin").setup({
--	flavour = "auto", -- latte, frappe, macchiato, mocha
--	background = { -- :h background
--		light = "latte",
--		dark = "mocha",
--	},
--	transparent_background = false, -- disables setting the background color.
--	show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
--	term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
--	dim_inactive = {
--		enabled = false, -- dims the background color of inactive window
--		shade = "dark",
--		percentage = 0.15, -- percentage of the shade to apply to the inactive window
--	},
--	no_italic = false, -- Force no italic
--	no_bold = false, -- Force no bold
--	no_underline = false, -- Force no underline
--	styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
--		comments = { "italic" }, -- Change the style of comments
--		conditionals = { "italic" },
--		loops = {},
--		functions = {},
--		keywords = {},
--		strings = {},
--		variables = {},
--		numbers = {},
--		booleans = {},
--		properties = {},
--		types = {},
--		operators = {},
--		-- miscs = {}, -- Uncomment to turn off hard-coded styles
--	},
--	color_overrides = {},
--	custom_highlights = {},
--	default_integrations = true,
--	integrations = {
--		cmp = true,
--		gitsigns = true,
--		nvimtree = true,
--		treesitter = true,
--		notify = false,
--		mini = {
--			enabled = true,
--			indentscope_color = "",
--		},
--		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--	},
--})
--
---- setup must be called before loading
--vim.cmd.colorscheme("catppuccin")
require("tokyonight").setup({
	-- use the night style
	style = "night",
	-- disable italic for functions
	styles = {
		functions = {},
	},
	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
	on_colors = function(colors)
		colors.hint = colors.orange
		colors.error = "#ff0000"
	end,

	on_highlights = function(hl, c)
		local prompt = "#2d3149"
		hl.TelescopeNormal = {
			bg = c.bg_dark,
			fg = c.fg_dark,
		}
		hl.TelescopeBorder = {
			bg = c.bg_dark,
			fg = c.bg_dark,
		}
		hl.TelescopePromptNormal = {
			bg = prompt,
		}
		hl.TelescopePromptBorder = {
			bg = prompt,
			fg = prompt,
		}
		hl.TelescopePromptTitle = {
			bg = prompt,
			fg = prompt,
		}
		hl.TelescopePreviewTitle = {
			bg = c.bg_dark,
			fg = c.bg_dark,
		}
		hl.TelescopeResultsTitle = {
			bg = c.bg_dark,
			fg = c.bg_dark,
		}
	end,
})
vim.cmd([[colorscheme tokyonight-night]])
vim.g.tokyonight_dark_float = false
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })

local soft_tab_2 = function()
	vim.cmd("set tabstop=2 shiftwidth=2 expandtab")
end
local hard_tab_3 = function()
	vim.cmd("set tabstop=3 shiftwidth=3 noexpandtab")
end

--vim.opt.spelllang = 'en_us'
--vim.opt.spell = true

vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
	pattern = {
		"*.dart",
		"*.go",
		--"*.ts",
		--"*.lua",
	},
	callback = soft_tab_2,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
	pattern = {
		"*.ts",
		"*.lua",
	},
	callback = hard_tab_3,
})
--augroup markdown_language_client_commands
--    autocmd!
--    autocmd WinLeave __LanguageClient__ ++nested call <SID>fixLanguageClientHover()
--augroup END
--
--function! s:fixLanguageClientHover()
--    setlocal modifiable
--    setlocal conceallevel=2
--    normal i
--    setlocal nomodifiable
--endfunction
