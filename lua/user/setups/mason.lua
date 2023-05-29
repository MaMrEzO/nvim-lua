require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		--'cspell',
		'eslint',
		'gopls',
		'grammarly',
		'html',
		'lua_ls',
		'svelte',
		'tailwindcss',
		'tsserver',
		'cssls',
		'jsonls',
		--'protolint',
	},
})
