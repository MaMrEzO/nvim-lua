--Nvim Tree setup and mapping
local config = require'user.configs.nvim-tree-config'
local opts = require'user.configs.mapping'
require('nvim-tree').setup(config)

vim.keymap.set('n', "<space>l", ':NvimTreeFindFile<CR>', opts)
