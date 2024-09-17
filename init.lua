if vim.g.vscode then
else
	require("user.lazy")
	--require "user.nlsp"
	--require 'user.setups.mason'
	require("user.lsp")
	require("user.nvim-cmp") -- This is the Neo-Vim options
	require("user.setups")
	--require "user.dap"
	require("user.options")
end
