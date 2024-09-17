local opts = require 'user.configs.mapping'

vim.keymap.set('n', "<LEADER>l", ':Telescope find_files<CR>', opts)
vim.keymap.set('n', "<LEADER>.", ':Telescope file_browser path=%:p:h<CR>', opts)
--vim.keymap.set('n', '<leader>.', function() require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h') }) end)
vim.keymap.set('n', "<LEADER><LEADER>", ':Telescope find_files<CR>', opts)
vim.keymap.set('n', "<LEADER>r", ':Telescope resume<CR>', opts)
vim.keymap.set('n', "<LEADER>bb", ':Telescope buffers<CR>', opts)
vim.keymap.set('n', "<LEADER>g", ':Telescope live_grep<CR>', opts)
--vim.keymap.set('n', "<space>o", ':Telescope lsp_document_symbols<CR>', opts)
vim.keymap.set('n', "<space>o", function()
	require('telescope.builtin').lsp_document_symbols(

	---@param opts table: options to pass to the picker
	---@field fname_width number: defines the width of the filename section (default: 30)
	---@field symbol_width number: defines the width of the symbol section (default: 25)
	---@field symbol_type_width number: defines the width of the symbol type section (default: 8)
	---@field show_line boolean: if true, shows the content of the line the tag is found on (default: false)
	---@field symbols string|table: filter results by symbol kind(s)
	---@field ignore_symbols string|table: list of symbols to ignore
	---@field symbol_highlights table: string -> string. Matches symbol with hl_group
	---@field file_encoding string: file encoding for the previewer
		{
			opts = {
				show_line = true,
				ignore_symbols = { 'variable' },
			},
		})
end, opts)


vim.keymap.set('n', "<leader>m", function()
	--local pickerOpts = require('telescope.themes').get_dropdown({
	--	winblend = 10,
	--	width = 0.9,
	--	results_height = 15,
	--})
	--pickerOpts.show_line = false
	--pickerOpts.symbols = { "method", "function" }
	require('telescope.builtin').lsp_document_symbols(
		--pickerOpts
	---@param opts table: options to pass to the picker
	---@field fname_width number: defines the width of the filename section (default: 30)
	---@field symbol_width number: defines the width of the symbol section (default: 25)
	---@field symbol_type_width number: defines the width of the symbol type section (default: 8)
	---@field show_line boolean: if true, shows the content of the line the tag is found on (default: false)
	---@field symbols string|table: filter results by symbol kind(s)
	---@field ignore_symbols string|table: list of symbols to ignore
	---@field symbol_highlights table: string -> string. Matches symbol with hl_group
	---@field file_encoding string: file encoding for the previewer
	)
	--print(vim.inspect(pickerOpts))
end, opts)

vim.keymap.set('n', "<space>s", ':Telescope lsp_workspace_symbols<CR>', opts)

vim.keymap.set('n', "<space>d", ':Telescope diagnostics bufnr=0<CR>', opts)
vim.keymap.set('n', "<leader>d", ':Telescope diagnostics<CR>', opts)
vim.keymap.set('n', "gi", ':Telescope lsp_implementations<CR>', opts)

vim.keymap.set('n', "gd", function()
	require('telescope.builtin').lsp_definitions({
		--- Goto the definition of the word under the cursor, if there's only one, otherwise show all options in Telescope
		---@param opts table: options to pass to the picker
		---@field jump_type string: how to goto definition if there is only one and the definition file is different from the current file, values: "tab", "split", "vsplit", "never"
		---@field fname_width number: defines the width of the filename section (default: 30)
		---@field show_line boolean: show results text (default: true)
		---@field trim_text boolean: trim results text (default: false)
		---@field file_encoding string: file encoding for the previewer
		show_line = true,
		fname_width = 80,
	})
end, opts)

vim.keymap.set('n', "gw", require('telescope.builtin').grep_string, opts)
vim.keymap.set('n', "gs", require('telescope.builtin').git_status, opts)

--vim.keymap.set('n', "gr", ':Telescope lsp_references<CR>', opts)
vim.keymap.set('n', "gr", function()
	require('telescope.builtin').lsp_references({
		--- Lists LSP references for word under the cursor, jumps to reference on `<cr>`
		---@param opts table: options to pass to the picker
		---@field include_declaration boolean: include symbol declaration in the lsp references (default: true)
		---@field include_current_line boolean: include current line (default: false)
		---@field fname_width number: defines the width of the filename section (default: 30)
		---@field show_line boolean: show results text (default: true)
		---@field trim_text boolean: trim results text (default: false)
		---@field file_encoding string: file encoding for the previewer
		show_line = false,
		include_current_line = true,
		fname_width = 80,
	})
end, opts)


vim.keymap.set('n', "<leader>w", function()
	require('telescope.builtin').lsp_dynamic_workspace_symbols({

		---@param opts table: options to pass to the picker
		---@field fname_width number: defines the width of the filename section (default: 30)
		---@field symbol_width number: defines the width of the symbol section (default: 25)
		---@field symbol_type_width number: defines the width of the symbol type section (default: 8)
		---@field show_line boolean: if true, shows the content of the line the tag is found on (default: false)
		---@field symbols string|table: filter results by symbol kind(s)
		---@field ignore_symbols string|table: list of symbols to ignore
		---@field symbol_highlights table: string -> string. Matches symbol with hl_group
		---@field file_encoding string: file encoding for the previewer
		show_line = false,
		ignore_symbols = { 'variable' },
	})
end, opts)
