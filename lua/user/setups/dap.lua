require('dap.ext.vscode').json_decode = require 'json5'.parse
--require('dap.ext.vscode').json_decode = vim.fn.json_decode

----local dap = require('dap')
----dap.defaults.fallback.external_terminal = {
----	command = '/usr/bin/alacritty',
----	args = { '-e' },
----}
--
----dap.adapters.go = function(callback, config)
----  -- Wait for delve to start
----    vim.defer_fn(function()
----        callback({type = "server", host = "127.0.0.1", port = "port"})
----      end,
----    100)
----end
----
--dap.adapters.delve = {
--	type = 'server',
--	port = '${port}',
--	executable = {
--		command = 'dlv',
--		args = { 'dap', '-l', '127.0.0.1:${port}', '--log', '--log-output="dap"' },
--	}
--}
--
---- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
--dap.configurations.go = {
--	{
--		type = "delve",
--		name = "Debug",
--		request = "launch",
--		program = "${file}"
--	},
--	{
--		type = "delve",
--		name = "Debug test", -- configuration for debugging test files
--		request = "launch",
--		mode = "test",
--		program = "${file}"
--	},
--	-- works with go.mod packages and sub packages
--	{
--		type = "delve",
--		name = "Debug test (go.mod)",
--		request = "launch",
--		mode = "test",
--		program = "./${relativeFileDirname}"
--	}
--}

-- `DapBreakpoint` for breakpoints (default: `B`)
vim.fn.sign_define('DapBreakpoint', { text = ' ', texthl = 'DiagnosticError', linehl = '', numhl = '' })
-- `DapBreakpointCondition` for conditional breakpoints (default: `C`)
vim.fn.sign_define('DapBreakpointCondition', { text = ' ', texthl = '', linehl = '', numhl = '' })
-- `DapLogPoint` for log points (default: `L`)
vim.fn.sign_define('DapLogPoint', { text = ' ', texthl = '', linehl = '', numhl = '' })
-- `DapStopped` to indicate where the debugee is stopped (default: `→`)
vim.fn.sign_define('DapStopped', { text = ' ', texthl = 'DiagnosticOk', linehl = 'CursorLine', numhl = '' })
-- `DapBreakpointRejected` to indicate breakpoints rejected by the debug
vim.fn.sign_define('DapBreakpointRejected', { text = ' ', texthl = 'DiagnosticWarn', linehl = '', numhl = '' })

require "user.mapping.dap-mapping"
require('dap.ext.vscode').load_launchjs(nil, {})
require('nvim-dap-repl-highlights').setup()

local dap = require'dap'

dap.defaults.fallback.terminal_win_cmd = '50vsplit new'
dap.defaults.fallback.focus_terminal = true
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dap-repl",
  command = "setl ft=terminal"
})

local terminal = require'terminal'

--vim.api.nvim_create_autocmd("FileType", {
--  pattern = "dap-repl",
--  callback = function(ev)
--    print(string.format('event fired: %s', vim.inspect(ev)))
--    print(string.format('event fired: %s', vim.inspect(ev.buf)))
--    terminal.attach_to_buffer(ev.buff)
--  end
--})
--
--vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
--  pattern = "*.dap-repl",
--  --command = "setl ft=terminal"
--  callback = function(ev)
--    print(string.format('event fired: s', vim.inspect(ev)))
--    terminal.attach_to_buffer(ev.buff)
--  end
--})
