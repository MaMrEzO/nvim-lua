local opts = require 'user.configs.mapping'
--Setting breakpoints via :lua require'dap'.toggle_breakpoint().
vim.keymap.set('n', "<F9>", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
vim.keymap.set('n', "<F12>", ":lua require(\"dapui\").open()<CR>", opts)
vim.keymap.set('n', "<S-F12>", ":lua require(\"dapui\").close()<CR>", opts)
vim.keymap.set('n', "<F24>", ":lua require(\"dapui\").close()<CR>", opts)
vim.keymap.set('n', "<C-k>", ":lua require(\"dapui\").eval()<CR>", opts)

--Launching debug sessions and resuming execution via :lua require'dap'.continue().
vim.keymap.set('n', "<F5>", ":lua require'dap'.continue()<CR>", opts)
vim.keymap.set('n', "<F17>", ":DapLoadLaunchJSON<CR>", opts)
vim.keymap.set('n', "<S-F5>", ":DapLoadLaunchJSON<CR>", opts)
vim.keymap.set('n', "<C-F5>", ":lua require('dap-go').debug_test()", opts)
--Stepping through code via :lua require'dap'.step_over() and :lua require'dap'.step_into().
vim.keymap.set('n', "<F11>", ":lua require'dap'.step_into()<CR>", opts)
vim.keymap.set('n', "<F10>", ":lua require'dap'.step_over()<CR>", opts)

--vim.keymap.set('n', "gi", ":Telescope lsp_implementations<CR>", opts)
--vim.keymap.set('n', "gd", ":Telescope lsp_definitions<CR>", opts)
--vim.keymap.set('n', "gw", require('telescope.builtin').grep_string, opts)
--vim.keymap.set('v', "gw", require('telescope.builtin').grep_string, opts)
--vim.keymap.set('n', "gr", ":Telescope lsp_references<CR>", opts)
--
--
