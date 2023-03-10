local navic = require("nvim-navic")
--local lsp_sig = require('lsp_signature')

local use = require('packer').use
require('packer').startup(function()
	use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
end)

--sign define LspDiagnosticsErrorSign text=!
--sign define LspDiagnosticsWarningSign text=?
--sign define LspDiagnosticsInformationSign text=i
--sign define LspDiagnosticsHintSign text=.
--vim.fn.sign_define("LspDiagnosticsSignError", {text="!", texthl="LspDiagnosticsError"})
--vim.fn.sign_define("LspDiagnosticsSignWarning", {text="?", texthl="LspDiagnosticsWarning"})
--vim.fn.sign_define("LspDiagnosticsSignInformation", {text="i", texthl="LspDiagnosticsInformation"})
--vim.fn.sign_define("LspDiagnosticsSignHint", {text=".", texthl="LspDiagnosticsHint"})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Add additional capabilities supported by nvim-cmp
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<C-,>', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<C-;>', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

--vim.cmd([[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]])

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	navic.attach(client, bufnr)
	--lsp_sig.on_attach(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	--vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	--vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	--vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('i', '<M-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)
	--vim.keymap.set('n', '<space>e', vim.lsp.diagnostic.show_position_diagnostics, bufopts)
	-- vim.lsp.diagnostic.show_line_diagnostics
	--if client.server_capabilities.document_highlight then
	--	vim.cmd [[
	--   hi! LspReferenceRead cterm=bold ctermbg=235 guibg=LightYellow
	--   hi! LspReferenceText cterm=bold ctermbg=235 guibg=LightYellow
	--   hi! LspReferenceWrite cterm=bold ctermbg=235 guibg=LightYellow
	-- ]]
	--	vim.api.nvim_create_augroup('lsp_document_highlight', {})
	--	vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
	--		group = 'lsp_document_highlight',
	--		buffer = 0,
	--		callback = vim.lsp.buf.document_highlight,
	--	})
	--	vim.api.nvim_create_autocmd('CursorMoved', {
	--		group = 'lsp_document_highlight',
	--		buffer = 0,
	--		callback = vim.lsp.buf.clear_references,
	--	})
	--end
	--if client.server_capabilities.document_highlight then
	--	vim.api.nvim_exec(
	--		[[
	--			hi! LspReferenceRead cterm=bold ctermbg=235 guibg=LightYellow
	--			hi! LspReferenceText cterm=bold ctermbg=235 guibg=LightYellow
	--			hi! LspReferenceWrite cterm=bold ctermbg=235 guibg=LightYellow
	--			augroup lsp_document_highlight
	--			  autocmd! * <buffer>
	--			  autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
	--			  autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
	--			augroup END
	-- ]], false)
	--end
	--print('Buff Attached')
	if client.server_capabilities.documentHighlightProvider then
		vim.cmd([[
			 hi! link LspReferenceRead Visual
			 hi! link LspReferenceText Visual
			 hi! link LspReferenceWrite Visual
		  ]])

		local gid = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
		vim.api.nvim_create_autocmd("CursorHold", {
			group = gid,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.document_highlight()
			end
		})

		vim.api.nvim_create_autocmd("CursorMoved", {
			group = gid,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.clear_references()
			end
		})
	end
end

--require 'lspconfig'.svelte.setup {
--	on_attach = on_attach,
--	capabilities = capabilities
--}
--
--require 'lspconfig'.gopls.setup {
--	on_attach = on_attach,
--	capabilities = capabilities
--}
--
--require 'lspconfig'.tsserver.setup {
--	on_attach = on_attach,
--	capabilities = capabilities,
--	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
--	--filetypes = {"js", "ts", "jsx", "tsx", "json", "json5"}
--}
--
require 'lspconfig'.rust_analyzer.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	--cmd = {'~/.local/bin/rust-analyzer'}
	settings = {
		["rust-analyzer"] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true
			},
		}
	}
}

require 'lspconfig'.lua_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			library = {
				"/usr/share/nvim/runtime/lua",
				"/usr/share/nvim/runtime/lua/vim/lsp"
			},
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
}
local servers = { 'svelte', 'gopls', 'tsserver', 'bashls' }
for _, lsp in ipairs(servers) do
	require('lspconfig')[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

--require("lspconfig").clangd.setup {
--    on_attach = function(client, bufnr)
--        navic.attach(client, bufnr)
--    end
--}

require("flutter-tools").setup {
	ui = {
		-- the border type to use for all floating windows, the same options/formats
		-- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
		border = "rounded",
		-- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
		-- please note that this option is eventually going to be deprecated and users will need to
		-- depend on plugins like `nvim-notify` instead.
		notification_style = 'plugin' -- 'native' |
	},
	decorations = {
		statusline = {
			-- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
			-- this will show the current version of the flutter app from the pubspec.yaml file
			app_version = false,
			-- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
			-- this will show the currently running device if an application was started with a specific
			-- device
			device = false,
		}
	},
	debugger = { -- integrate with nvim dap + install dart code debugger
		enabled = false,
		run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
		-- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
		-- see |:help dap.set_exception_breakpoints()| for more info
		exception_breakpoints = {},
		--register_configurations = function(paths)
		--  require("dap").configurations.dart = {
		--    <put here config that you would find in .vscode/launch.json>
		--  }
		--end,
	},
	--flutter_path = "<full/path/if/needed>", -- <-- this takes priority over the lookup
	flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
	fvm = false, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
	widget_guides = {
		enabled = false,
	},
	closing_tags = {
		highlight = "ErrorMsg", -- highlight for the closing tag
		prefix = ">", -- character to use for close tag e.g. > Widget
		enabled = true -- set to false to disable
	},
	dev_log = {
		enabled = true,
		open_cmd = "tabedit", -- command to use to open the log buffer
	},
	dev_tools = {
		autostart = false, -- autostart devtools server if not detected
		auto_open_browser = false, -- Automatically opens devtools in the browser
	},
	outline = {
		open_cmd = "30vnew", -- command to use to open the outline buffer
		auto_open = false -- if true this will open the outline automatically when it is first populated
	},
	lsp = {
		color = { -- show the derived colours for dart variables
			enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
			background = false, -- highlight the background
			foreground = false, -- highlight the foreground
			virtual_text = true, -- show the highlight using virtual text
			virtual_text_str = "■", -- the virtual text character to highlight
		},
		on_attach = on_attach,
		--capabilities = my_custom_capabilities -- e.g. lsp_status capabilities
		--- OR you can specify a function to deactivate or change or control how the config is created
		--capabilities = function(config)
		--  config.specificThingIDontWant = false
		--  return config
		--end,
		capabilities = capabilities,
		-- see the link below for details on each option:
		-- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
		settings = {
			showTodos = true,
			completeFunctionCalls = true,
			analysisExcludedFolders = { "<path-to-flutter-sdk-packages>" },
			renameFilesWithClasses = "prompt", -- "always"
			enableSnippets = true,
		}
	}
}
--vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, noremap = true, silent = true })
