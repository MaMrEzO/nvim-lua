local opts = require'user.configs.mapping'

vim.keymap.set('v', "<silent> <TAB>", '>gv', opts)
vim.keymap.set('v', "<silent> <S-TAB>",  '<gv', opts)

--vnoremap <TAB> >gv
--vnoremap <S-TAB> <gv

