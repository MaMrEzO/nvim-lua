local function paste(obj)
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  print(obj.stdout)
  vim.api.nvim_put({obj.stdout}, 'l', true, false)
end

if vim.env.XDG_SESSION_TYPE == 'x11' then
	vim.keymap.set('n', "l", function()
		vim.system({'xsel', '-ob'}, { text = true }, vim.schedule_wrap(paste))
	end, { noremap = true, silent = true })
else
end
--
--
--
--
