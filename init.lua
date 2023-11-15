if vim.g.vscode then
else

  require "user.lazy"
  --require "user.nlsp"
  --require 'user.setups.mason'
  require "user.lsp"
  require "user.nvim-cmp" -- This is the Neo-Vim options
  require "user.options"
  require "user.setups"
  --require "user.dap"
  -- Normal        xxx guifg=#ced1d4 guibg=#262627
  -- NormalNC      xxx guifg=#ced1d4 guibg=#232324
  -- NormalFloat   xxx guifg=#ced1d4 guibg=#303031
end
