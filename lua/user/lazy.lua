local fn = vim.fn
local noice_config = require("user.configs.noice-config")
local notify_config = require("user.configs.notify-config")
local neo_tree_config = require("user.configs.neo-tree")
local nivm_window_picker = require("user.configs.nvim-window-picker")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

---- Autocommand that reloads neovim whenever you save the plugins.lua file
----vim.cmd [[
----  augroup packer_user_config
----    autocmd!
----    autocmd BufWritePost plugins.lua source <afile> | PackerSync
----  augroup end
----]]
--

-- Install your plugins here
return require("lazy").setup({
	--"wbthomason/packer.nvim",

	-- UI
	-- {
	--	'kyazdani42/nvim-tree.lua',
	--	dependencies = {
	--		'kyazdani42/nvim-web-devicons', -- optional, for file icons
	--	},
	--	tag = 'nightly'    -- optional, updated every week. (see issue #1193)
	--}
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			{
				"s1n7ax/nvim-window-picker",
				name = "window-picker",
				event = "VeryLazy",
				version = "2.*",
				config = nivm_window_picker,
			},
		},
		config = neo_tree_config,
	},
	-- {
	--	'nvim-neo-tree/neo-tree.nvim',
	--	branch = 'v2.x',
	--	dependencies = {
	--		'nvim-lua/plenary.nvim',
	--		'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
	--		'MunifTanjim/nui.nvim',
	--	}
	--}

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                            , branch = '0.1.x',
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
	},
	--{
	--	'nvim-telescope/telescope-fzf-native.nvim',
	--	build = 'make',
	--},
	--'nvim-telescope/telescope-file-browser.nvim',

	---- gh github-cli
	-- {
	--	'ldelossa/gh.nvim',
	--	dependencies = { { 'ldelossa/litee.nvim' } }
	--}

	-- {
	--	'harrisoncramer/gitlab.nvim',
	--	dependencies = {
	--		'MunifTanjim/nui.nvim',
	--		'nvim-lua/plenary.nvim'
	--	},
	--	build = function() require('gitlab').build() end,
	--	config = function()
	--		require('gitlab').setup()
	--	end,
	--}

	-- 'lukas-reineke/indent-blankline.nvim'
	-- 'nvimdev/indentmini.nvim'

	-- Bars ...
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
	},
	--Checking if make faulty noice
	-- 'fgheng/winbar.nvim'
	-- {
	--	'SmiteshP/nvim-navic',
	--	dependencies = 'neovim/nvim-lspconfig'
	--}

	--Fancy bread crumb : ))))))
	--{
	--	"Bekaboo/dropbar.nvim", --3daffc1
	--	commit = "3daffc1",
	--	dependencies = {
	--		"nvim-telescope/telescope-fzf-native.nvim",
	--		build = "make",
	--	},
	--},
	"ThePrimeagen/harpoon",

	"luukvbaal/statuscol.nvim",

	-- Theme & Stuff
	"Rigellute/shades-of-purple.vim",
	"rktjmp/lush.nvim",
	{
		"briones-gabriel/darcula-solid.nvim",
		dependencies = "rktjmp/lush.nvim",
	},
	{ "projekt0n/github-nvim-theme" },
	{ "catppuccin/nvim", as = "catppuccin" },
	"marko-cerovac/material.nvim",
	"Shatur/neovim-ayu",

	-- {
	--	'folke/zen-mode.nvim',
	--}
	"Mofiqul/dracula.nvim",

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		--config = function()
		--	require('nvim-treesitter.configs').setup({
		--		ensure_installed = { 'lua' },
		--		sync_install = true,
		--		auto_install = true,
		--	})
		--end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
	},
	"nvim-treesitter/playground",
	"brenoprata10/nvim-highlight-colors",
	-- not  'norcalli/nvim-colorizer.lua'
	--{ 'anuvyklack/pretty-fold.nvim',
	--  config = function()
	--    require('pretty-fold').setup()
	--  end
	--}

	-- LSP Configurations
	-- 'williamboman/nvim-lsp-installer'
	"davidmh/cspell.nvim",
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
	},

	"stevearc/conform.nvim",
	"zapling/mason-conform.nvim",
	--"mfussenegger/nvim-lint",
	--"rshkarin/mason-nvim-lint",
	{
		"nvimtools/none-ls.nvim",
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		--config = function()
		--	require("your.null-ls.config") -- require your null-ls config here (example below)
		--end,
	},
	{ "folke/neodev.nvim", opts = {} },
	-- { 'neovim/nvim-lspconfig', -- Configurations for Nvim LSP
	--	--after = 'nvim-lsp-installer',
	--}
	"tamago324/nlsp-settings.nvim",
	-- 'ray-x/lsp_signature.nvim'-- Function signiture
	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		config = true,
	},
	"onsails/lspkind.nvim",
	"simrat39/symbols-outline.nvim",
	"f-person/git-blame.nvim",
	{
		"lewis6991/gitsigns.nvim",
		-- tag = 'release' -- To  the latest release (do not use this if you build Neovim nightly or dev builds!)
	},
	{
		"Equilibris/nx.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		--config = function()
		--	require('nx').setup {}
		--end
	},
	-- {
	--	'SmiteshP/nvim-navbuddy',
	--
	--	dependencies = {
	--		'neovim/nvim-lspconfig',
	--		'SmiteshP/nvim-navic',
	--		'MunifTanjim/nui.nvim'
	--	}
	--}
	-- 'lvimuser/lsp-inlayhints.nvim'
	"MysticalDevil/inlay-hints.nvim",

	-- Debugger
	"mfussenegger/nvim-dap",
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
	},
	"theHamsta/nvim-dap-virtual-text",
	"rcarriga/cmp-dap",
	"leoluz/nvim-dap-go",
	"LiadOz/nvim-dap-repl-highlights",
	--'mxsdev/nvim-dap-vscode-js',

	--{
	--	'microsoft/vscode-js-debug',
	--	build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out'
	--},
	{
		"microsoft/vscode-js-debug",
		-- After install, build it and rename the dist directory to out
		build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
		version = "1.*",
	},
	{
		"mxsdev/nvim-dap-vscode-js",
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("dap-vscode-js").setup({
				-- Path of node executable. Defaults to $NODE_PATH, and then "node"
				-- node_path = "node",

				-- Path to vscode-js-debug installation.
				debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),

				-- Command to use to launch the debug server. Takes precedence over "node_path" and "debugger_path"
				-- debugger_cmd = { "js-debug-adapter" },

				-- which adapters to register in nvim-dap
				adapters = {
					"chrome",
					"pwa-node",
					"pwa-chrome",
					"pwa-msedge",
					"pwa-extensionHost",
					"node-terminal",
				},

				-- Path for file logging
				-- log_file_path = "(stdpath cache)/dap_vscode_js.log",

				-- Logging level for output to file. Set to false to disable logging.
				-- log_file_level = false,

				-- Logging level for output to console. Set to false to disable console output.
				-- log_console_level = vim.log.levels.ERROR,
			})
		end,
	},

	{
		-- d to dap-ext-vscode JSON decoder
		"Joakker/lua-json5",
		build = "./install.sh",
	},
	-- Recommend

	-- Optional
	--replace with noice
	-- 'rcarriga/nvim-notify'

	"tpope/vim-fugitive",
	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp", -- Autocompletion plugin
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
	},
	"saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
	"L3MON4D3/LuaSnip", -- Snippets plugin

	--Colorize ansi output
	-- { 'm00qek/baleia.nvim', tag = 'v1.3.0' }
	"norcalli/nvim-terminal.lua",

	{ "stevearc/dressing.nvim" },
	{
		"folke/noice.nvim",
		event = "VimEnter",
		config = noice_config,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module='...'` entries
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				config = notify_config,
			},
		},
	},

	"chiedo/vim-case-convert",

	--{
	--	'kristijanhusak/vim-dadbod-ui',
	--	dependencies = {
	--		{ 'tpope/vim-dadbod',                     lazy = true },
	--		{ 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
	--	},
	--	cmd = {
	--		'DBUI',
	--		'DBUIToggle',
	--		'DBUIAddConnection',
	--		'DBUIFindBuffer',
	--	},
	--	init = function()
	--		-- Your DBUI configuration
	--		vim.g.db_ui_use_nerd_fonts = 1
	--	end,
	--},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	--Ghost editor for Google - Chrome
	-- ({
	--	'subnut/nvim-ghost.nvim',
	--	build = ':call nvim_ghost#installer#install()'
	--})
})
