local opts = require 'user.configs.mapping'

vim.keymap.set('n', '<leader>', ':Neotree reveal<CR>', opts)
vim.keymap.set('n', '<leader>b', ':Neotree reveal buffers<CR>', opts)
vim.keymap.set('n', '<leader>bg', ':Neotree reveal git_status<CR>', opts)
vim.keymap.set('n', '<M-Bslash>', ':Neotree close<CR>', opts)

