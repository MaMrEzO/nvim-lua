local fn = vim.fn
local noice_config = require 'user.configs.noice-config'
local notify_config = require 'user.configs.notify-config'
local neo_tree_config = require 'user.configs.neo-tree'
local nivm_window_picker = require 'user.configs.nvim-window-picker'

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Only required if you have packer configured as `opt`
vim.cmd("packadd packer.nvim")

-- Install your plugins here
return packer.startup(function(use)
	use 'wbthomason/packer.nvim'

	-- UI
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly'              -- optional, updated every week. (see issue #1193)
	}
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			{
				-- only needed if you want to use the commands with "_with_window_picker" suffix
				's1n7ax/nvim-window-picker',
				tag = "v1.*",
				config = nivm_window_picker,
			}
		},
		config = neo_tree_config
	}
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		}
	}

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim', "nvim-telescope/telescope-live-grep-args.nvim" } }
	}

	use "https://github.com/nvim-telescope/telescope-file-browser.nvim"

	use "lukas-reineke/indent-blankline.nvim"

	-- Bars ...
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	--Checking if make faulty noice
	use 'fgheng/winbar.nvim'
	use {
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig"
	}

	use 'ThePrimeagen/harpoon'

	-- Theme & Stuff
	--use 'Rigellute/shades-of-purple.vim'
	use "rktjmp/lush.nvim"
	--use {
	--	"briones-gabriel/darcula-solid.nvim",
	--}
	use 'Mofiqul/dracula.nvim'

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup({
				ensure_installed = { "lua" },
				sync_install = true,
				auto_install = true,
			})
		end,

	}
	use 'nvim-treesitter/playground'
	use 'brenoprata10/nvim-highlight-colors'
	-- not use 'norcalli/nvim-colorizer.lua'
	--use{ 'anuvyklack/pretty-fold.nvim',
	--  config = function()
	--    require('pretty-fold').setup()
	--  end
	--}

	-- LSP Configurations
	--use 'williamboman/nvim-lsp-installer'
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		run = ":MasonUpdate"      -- :MasonUpdate updates registry contents
	}
	use { 'neovim/nvim-lspconfig', -- Configurations for Nvim LSP
		--after = "nvim-lsp-installer",
	}
	use 'tamago324/nlsp-settings.nvim'
	--use "ray-x/lsp_signature.nvim"-- Function signiture
	use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' }
	use 'onsails/lspkind.nvim'
	--use 'jose-elias-alvarez/null-ls.nvim'
	--use 'MunifTanjim/eslint.nvim'
	use 'simrat39/symbols-outline.nvim'
	use 'f-person/git-blame.nvim'
	use {
		'lewis6991/gitsigns.nvim',
		-- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	}
	use {
		'Equilibris/nx.nvim',
		requires = {
			'nvim-telescope/telescope.nvim',
		},
		--config = function()
		--	require("nx").setup {}
		--end
	}
	use {
		"SmiteshP/nvim-navbuddy",
		requires = {
			"neovim/nvim-lspconfig",
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim"
		}
	}
	use "lvimuser/lsp-inlayhints.nvim"

	-- Debugger
	use 'mfussenegger/nvim-dap'
	use {
		"rcarriga/nvim-dap-ui",
		requires = {
			"mfussenegger/nvim-dap"
		}
	}
	use 'theHamsta/nvim-dap-virtual-text'
	use 'rcarriga/cmp-dap'
	use 'leoluz/nvim-dap-go'
	use 'theHamsta/nvim-dap-virtual-text'
	use 'LiadOz/nvim-dap-repl-highlights'

	use {
		-- used to dap-ext-vscode JSON decoder
		'Joakker/lua-json5',
		run = './install.sh'
	}
	-- Recommend

	-- Optional
	--replace with noice
	--use 'rcarriga/nvim-notify'

	use 'tpope/vim-fugitive'
	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

	-- Autocompletion
	use {
		'hrsh7th/nvim-cmp', -- Autocompletion plugin
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-nvim-lsp'    -- LSP source for nvim-cmp
	}
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip'       -- Snippets plugin

	--Colorize ansi output
	--use { 'm00qek/baleia.nvim', tag = 'v1.3.0' }
	use 'norcalli/nvim-terminal.lua'

	use { 'stevearc/dressing.nvim' }
	use({
		"folke/noice.nvim",
		event = "VimEnter",
		config = noice_config,
		requires = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			({
				"rcarriga/nvim-notify",
				config = notify_config,
			}),
		}
	})

	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
		ft = { "markdown" },
	})
	--Ghost editor for Google - Chrome
	-- use({
	--	'subnut/nvim-ghost.nvim',
	--	run = ':call nvim_ghost#installer#install()'
	--})
end)
