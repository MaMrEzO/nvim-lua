local opts = require'user.configs.mapping'

vim.keymap.set('v', "<Tab>", '>gv', opts)
vim.keymap.set('v', "<S-Tab>", '<gv', opts)

--vnoremap <TAB> >gv
--vnoremap <S-TAB> <gv

