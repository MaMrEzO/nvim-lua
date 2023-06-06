--require 'user.setups.diffview';
require 'user.setups.nvim-web-devicons';
require 'user.setups.tree-sitter';
require 'user.setups.lua-line';
require 'user.setups.telescope';
require 'user.setups.symbol-outline';
require 'user.setups.indent_blankline';
require 'user.setups.gitsigns';
--
--mappings
--
--require 'user.mapping.telescope'
require 'user.mapping.nvim-tree'
require 'user.mapping.harpoon'
require 'user.mapping.flutter-toole-mapping'
require 'user.mapping.vim-fugitive';
require 'user.mapping.mapping';

require 'user.setups.highlight-colors';

--Problematics
require 'user.setups.nvim-navic';
--require 'user.setups.winbar';
require 'user.setups.eslint';
--require 'user.setups.dressing';
require 'user.setups.navbuddy';
--require 'user.setups.mason';
require "notify".setup(
	{
		render = "compact",
		top_down = false
	}
);

require "user.setups.dap";
require "user.setups.dap-ui";
require "user.setups.go-dap";
require "user.setups.dap-virtual-text";

--require('baleia').setup { }
require'terminal'.setup()
