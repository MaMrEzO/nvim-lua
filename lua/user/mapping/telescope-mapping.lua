-- This file is imported from the setups/telescope
local opts = require 'user.configs.mapping'

vim.keymap.set('n', "<LEADER>l", ':Telescope find_files<CR>', opts)
vim.keymap.set('n', "<LEADER><LEADER>", ':Telescope find_files<CR>', opts)
vim.keymap.set('n', "<LEADER>r", ":Telescope resume<CR>", opts)
vim.keymap.set('n', "<LEADER>g", ":Telescope live_grep<CR>", opts)
vim.keymap.set('n', "<LEADER>l", ':Telescope find_files<CR>', opts)
vim.keymap.set('n', "<space>o", ":Telescope lsp_document_symbols<CR>", opts)
vim.keymap.set('n', "<space>s", ":Telescope lsp_workspace_symbols<CR>", opts)

vim.keymap.set('n', "<space>d", ":Telescope diagnostics bufnr=0<CR>", opts)
vim.keymap.set('n', "<leader>d", ":Telescope diagnostics<CR>", opts)
vim.keymap.set('n', "gi", ":Telescope lsp_implementations<CR>", opts)
vim.keymap.set('n', "gd", ":Telescope lsp_definitions<CR>", opts)
vim.keymap.set('n', "gw", require('telescope.builtin').grep_string, opts)
vim.keymap.set('v', "gw", require('telescope.builtin').grep_string, opts)
vim.keymap.set('n', "gr", ":Telescope lsp_references<CR>", opts)
