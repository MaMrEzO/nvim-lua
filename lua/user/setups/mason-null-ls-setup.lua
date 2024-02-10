--require("mason-null-ls").setup({
--	ensure_installed = {
--		--'stylua', -- Opt to list sources here, when available in mason.
--		--'buf',
--		'cspell',
--		--'golangci_lint_ls',
--	},
--	automatic_installation = false,
--	--{
--	--	--'stylua', -- Opt to list sources here, when available in mason.
--	--	--'buf',
--	--	'cspell',
--	--	--'golangci_lint_ls',
--	--	exclude = {"protolint" }
--	--},
--	handlers = {},
--})
----
----
--local null_ls = require("null-ls")
--null_ls.setup({
--	sources = {
--		--	-- Anything not supported by mason.
--		null_ls.builtins.completion.spell,
--
--		--	--CodeActions
--		--	null_ls.builtins.code_actions.refactoring,
--		--	null_ls.builtins.code_actions.gomodifytags,
--
--		--	--Linting
--		--null_ls.builtins.diagnostics.golangci_lint,
--		null_ls.builtins.diagnostics.eslint,
--    null_ls.builtins.code_actions.eslint_d,
--    null_ls.builtins.formatting.prettier,
--
--		--	--Diag
--		--	--null_ls.builtins.diagnostics.revive,
--
--		--	--Format
--		null_ls.builtins.formatting.gofumpt,
--		null_ls.builtins.formatting.goimports,
--		null_ls.builtins.formatting.goimports_reviser,
--		--	null_ls.builtins.formatting.stylua,
--	},
--
--	-- #{m}: message
--	-- #{s}: source name (defaults to null-ls if not specified)
--	-- #{c}: code (if available)
--	diagnostics_format = "#{m} (#{s})",
--})
