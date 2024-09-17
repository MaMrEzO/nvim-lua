local conform = require("conform")
conform.setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    --svelte = { 'prettier' },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    --graphql = { 'prettier' },
    --liquid = { 'prettier' },
    lua = { "stylua" },
    --python = { 'isort', 'black' },
    --c = { 'clang-format' },
    --cpp = { 'clang-format' },
    --c_sharp = { 'csharpier' },
    go = { "gofmt" },
    --rust = { 'rustfmt' },
    --php = { 'pretty-php' },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  },
})

require("mason-conform").setup()
--
--local lint = require("lint")
--lint.linters_by_ft = {
--	--c = { 'cpplint' },
--	--cpp = { 'cpplint' },
--	javascript = { "eslint_d" },
--	typescript = { "eslint_d" },
--	javascriptreact = { "eslint_d" },
--	typescriptreact = { "eslint_d" },
--	html = { "htmlhint" },
--	css = { "stylelint" },
--	--lua = { "luacheck" },
--	python = { "ruff" },
--	go = { "golangci-lint" },
--	--rust = { 'snyk' },
--	--php = { 'phpcs' },
--}
--
----require('mason-nvim-lint').setup()
--require("mason-nvim-lint").setup({
--	ensure_installed = { "cspell" }, -- bacon linter for rust is not available in nvim-lint, so it's specified to be directly installed from the mason's registry
--	quiet_mode = false,
--})
--
--vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--	callback = function()
--		require("lint").try_lint()
--		require("lint").try_lint("cspell")
--	end,
--})
--
----vim.api.nvim_create_autocmd({ "BufWritePost" }, {
----  callback = function()
----
----    -- try_lint without arguments runs the linters defined in `linters_by_ft`
----    -- for the current filetype
----    require("lint").try_lint()
----
----    -- You can call `try_lint` with a linter name or a list of names to always
----    -- run specific linters, independent of the `linters_by_ft` configuration
----    require("lint").try_lint("cspell")
----  end,
----})
