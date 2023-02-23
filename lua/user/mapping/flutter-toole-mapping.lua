local opts = require 'user.configs.mapping'

vim.keymap.set('n', "<leader>fR", ':FlutterRun', opts)
vim.keymap.set('n', "<leader>fr", ':FlutterRestart<CR>', opts)
vim.keymap.set('n', "<leader>fd", ':FlutterDevices<CR>', opts)
vim.keymap.set('n', "<leader>fq", ':FlutterQuit<CR>', opts)
vim.keymap.set('n', "<leader>fl", ':FlutterLogClear<CR>', opts)
--vim.keymap.set('n', "<leader>f", ':<CR>', opts)
--vim.keymap.set('n', "<leader>f", ':<CR>', opts)


-- FlutterRun
-- FlutterDevices
-- FlutterEmulators
-- FlutterReload
-- FlutterRestart
-- FlutterQuit
-- FlutterDetach
-- FlutterOutlineToggle
-- FlutterOutlineOpen
-- FlutterDevTools
-- FlutterCopyProfilerUrl
-- FlutterLspRestart
-- FlutterSuper
-- FlutterReanalyze
