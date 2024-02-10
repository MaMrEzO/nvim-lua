local opts = require 'user.configs.mapping'

vim.keymap.set('n', "<leader>td", function()
  vim.cmd('colorscheme github_dark_colorblind')
  vim.cmd('!kitten themes GitHub Dark Colorblind')
end, opts)


vim.keymap.set('n', "<leader>tl", function()
  vim.cmd('colorscheme github_light')
  vim.cmd('!kitten themes GitHub Light')
end, opts)
