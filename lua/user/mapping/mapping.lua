local opts = require'user.configs.mapping'

vim.keymap.set('v', "<Tab>", '>gv', opts)
vim.keymap.set('v', "<S-Tab>", '<gv', opts)

vim.keymap.set('v', "<leader>(", '"xc(<C-r><C-o>x)<esc>', opts)
vim.keymap.set('v', "<leader>'", '"xc\'<C-r><C-o>x\'<esc>', opts)
vim.keymap.set('v', '<leader>"', '"xc"<C-r><C-o>x"<esc>', opts)
vim.keymap.set('v', '<leader>`', '"xc`<C-r><C-o>x`<esc>', opts)
vim.keymap.set('v', "<leader>[", '"xc[<C-r><C-o>x]<esc>', opts)
vim.keymap.set('v', "<leader>{", '"xc{<CR><C-r><C-o>x<CR>}<esc>', opts)

vim.keymap.set('v', "<space>p", ":diffput<cr>", opts)
vim.keymap.set('v', "<space>g", ":diffget<cr>", opts)


vim.keymap.set('n', "<C-t>", ":tabnew<cr>", opts)

vim.keymap.set('n', "<M-Left>", "<C-w><Left>", opts)
vim.keymap.set('n', "<M-Right>", "<C-w><Right>", opts)
vim.keymap.set('n', "<M-Up>", "<C-w><Up>", opts)
vim.keymap.set('n', "<M-Down>", "<C-w><Down>", opts)

vim.keymap.set('n', "<leader>n", function()
	vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, opts)

vim.keymap.set('x', "<leader>p", '"_dp')
vim.keymap.set('x', "<leader>P", '"_dP')


--vim.keymap.set('x', "<Home>", '<NOP>')
--vim.keymap.set('n', "<Home>", '<NOP>')
--vim.keymap.set('i', "<Home>", '<NOP>')
--vim.keymap.set('x', "<End>", '<NOP>')
--vim.keymap.set('n', "<End>", '<NOP>')
--vim.keymap.set('i', "<End>", '<NOP>')
--vim.keymap.set('x', "<Left>", '<NOP>')
--vim.keymap.set('n', "<Left>", '<NOP>')
--vim.keymap.set('i', "<Left>", '<NOP>')
--vim.keymap.set('x', "<Right>", '<NOP>')
--vim.keymap.set('n', "<Right>", '<NOP>')
--vim.keymap.set('i', "<Right>", '<NOP>')
--vim.keymap.set('x', "<Up>", '<NOP>')
--vim.keymap.set('n', "<Up>", '<NOP>')
--vim.keymap.set('i', "<Up>", '<NOP>')
--vim.keymap.set('x', "<Down>", '<NOP>')
--vim.keymap.set('n', "<Down>", '<NOP>')
--vim.keymap.set('i', "<Down>", '<NOP>')
