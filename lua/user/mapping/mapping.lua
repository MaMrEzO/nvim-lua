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



vim.keymap.set('n', "<leader>n", function()
	vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, opts)

vim.keymap.set('x', "<leader>p", '"_dp')
vim.keymap.set('x', "<leader>P", '"_dP')
