require("user.setups.diffview")
require("user.setups.nvim-web-devicons")
require("user.setups.tree-sitter")
require("user.setups.lua-line")
require("user.setups.telescope")
require("user.setups.symbol-outline")
--require 'user.setups.indent_blankline';
require("user.setups.gitsigns")
require("user.setups.git-blame")
require("user.setups.dropbar-setup")
require("user.setups.nvim-ufo")
require("user.setups.statuscol-setup")
require("user.setups.lua-snip")
require("user.setups.org-mode")
--
--mappings
--
--require 'user.mapping.telescope-mapping'
require("user.mapping.yanki")
require("user.mapping.global")
require("user.mapping.neo-tree")
require("user.mapping.nvim-tree")
require("user.mapping.harpoon")
require("flutter-tools").setup({}) -- use defaults
require("user.mapping.flutter-toole-mapping")
require("user.mapping.vim-fugitive")
require("user.mapping.mapping")
require("user.mapping.dropbar-mapping")
require("user.mapping.theme")

require("user.setups.highlight-colors")

--Problematics
--require 'user.setups.nvim-navic';
--require 'user.setups.winbar';
--require 'user.setups.dressing';
--require 'user.setups.navbuddy';

require("notify").setup({
	render = "compact",
	top_down = false,
})

require("user.setups.dap")
require("user.setups.dap-ui")
require("user.setups.go-dap")
require("user.setups.dap-virtual-text")

--require 'user.setups.eslint';
--require 'user.setups.mason';
require("user.setups.mason-null-ls-setup")
require("user.setups.lint")
require("user.setups.inlay-hint-setup")

--require('baleia').setup { }
require("terminal").setup()

--require 'user.setups.gh-nvim-setup';
