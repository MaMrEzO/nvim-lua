vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

vim.cmd([[

" hi default UfoFoldedFg guifg=Normal.foreground
" hi default UfoFoldedBg guibg=Folded.background
hi default link UfoPreviewSbar PmenuSbar
hi default link UfoPreviewThumb PmenuThumb
hi default link UfoPreviewWinBar UfoFoldedBg
hi default link UfoPreviewCursorLine Visual
hi default link UfoFoldedEllipsis Comment
hi default link UfoCursorFoldedLine CursorLine
]])

require("ufo").setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "treesitter", "indent" }
	end,
	--provider_selector = function(bufnr, filetype, buftype)
	--	return ''
	--end
})

vim.keymap.set("n", "<C-u>", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		-- choose one of coc.nvim and nvim lsp
		vim.fn.CocActionAsync("definitionHover") -- coc.nvim
		vim.lsp.buf.hover()
	end
end)
