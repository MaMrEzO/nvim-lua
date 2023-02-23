local opts = require'user.configs.mapping'


vim.keymap.set('v', "<silent> <leader>d", ':diffput<cr>', opts)
vim.keymap.set('n', "<space>ha",  ':lua require("harpoon.mark").add_file()<cr>', opts)


