--require("null-ls").setup()
--require("mason-null-ls").setup({
--  methods = {
--
--  },
--	ensure_installed = { "stylua", "cspell", "prettierd", "eslint" },
--	automatic_setup = true,
--	handlers = {},
--})
----local cspell = require('cspell')
----local cspellConfig = require('user.configs.cspell')
--require("mason-null-ls").setup({
--	ensure_installed = {
--		--'stylua', -- Opt to list sources here, when available in mason.
--		--'buf',
--		'cspell',
--		--'golangci_lint_ls',
--	},
--	automatic_installation = false, --onestall
--	{
--		--	--'stylua', -- Opt to list sources here, when available in mason.
--		--	--'buf',
--		'cspell',
--		--	--'golangci_lint_ls',
--		--	exclude = {"protolint" }
--	},
--	handlers = {},
--})
------
------
-----
--
--
local cspell_config = {
	find_json = function(cwd)
		print("Locating dic " .. cwd .. "/cspell.json")
		return cwd .. "/cspell.json"
	end,
}
local cspell = require("cspell")

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		--	-- Anything not suppoarted by masonaaaa.
		--null_ls.builtins.completion.spell,

		--	--CodeActions
		--	null_ls.builtins.code_actions.refactoring,
		--	null_ls.builtins.code_actions.gomodifytags,

		--	--Linting
		--null_ls.builtins.diagnostics.golangci_lint,
		--null_ls.builtins.diagnostics.eslint,
		--null_ls.builtins.code_actions.eslint_d,
		--null_ls.builtins.formatting.prettier,

		--	--Diag
		--	--null_ls.builtins.diagnostics.revive,

		--	--Format
		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.goimports_reviser,
		--	null_ls.builtins.formatting.stylua,
		cspell.diagnostics.with({ config = cspell_config }),
		cspell.code_actions.with({ config = cspell_config }),
	},

	-- #{m}: message
	-- #{s}: source name (defaults to null-ls if not specified)
	-- #{c}: code (if available)
	diagnostics_format = "#{m} (#{s})",
})
