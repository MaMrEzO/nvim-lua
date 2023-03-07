local opts = require'user.configs.mapping'

vim.keymap.set('v', "<Tab>", '>gv', opts)
vim.keymap.set('v', "<S-Tab>", '<gv', opts)

vim.keymap.set('v', "(", '"xc(<C-r><C-o>x)<esc>', opts)
vim.keymap.set('v', "'", '"xc\'<C-r><C-o>x\'<esc>', opts)
vim.keymap.set('v', '"', '"xc"<C-r><C-o>x"<esc>', opts)
vim.keymap.set('v', '`', '"xc`<C-r><C-o>x`<esc>', opts)
vim.keymap.set('v', "[", '"xc[<C-r><C-o>x]<esc>', opts)
vim.keymap.set('v', "{", '"xc{<CR><C-r><C-o>x<CR>}<esc>', opts)
