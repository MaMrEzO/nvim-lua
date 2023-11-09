local opts = require'user.configs.mapping'

vim.keymap.set('n', "<space>b", ":lua require('dropbar.api').pick()<CR>", opts)
