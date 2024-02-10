local opts = require 'user.configs.mapping'

vim.keymap.set('n', '<leader>gt', ':GitBlameToggle<CR>', opts)

