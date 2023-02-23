local opts = require'user.configs.mapping'

local harpoon = require'harpoon.ui'

vim.keymap.set('n', "<space>h", ':lua require("harpoon.ui").toggle_quick_menu()<cr>', opts)
vim.keymap.set('n', "<space>ha",  ':lua require("harpoon.mark").add_file()<cr>', opts)

