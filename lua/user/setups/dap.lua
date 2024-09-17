--require('dap.ext.vscode').json_decode = require 'json5'.parse
require('dap.ext.vscode').json_decode = vim.fn.json_decode

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

local dap = require 'dap'

dap.defaults.fallback.terminal_win_cmd = '50vsplit new'
dap.defaults.fallback.focus_terminal = true
vim.api.nvim_create_autocmd("FileType", {
	pattern = "dap-repl",
	command = "setl ft=terminal"
})

--require('dap-vscode-js').setup({
--	node_path = 'node',
--	debugger_path = '/home/nima/Applications/jsDebug/vscode-js-debug',
--	adapters = { 'node', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
--})
----require("dap-vscode-js").setup({
----  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
----  -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
----  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
----  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
----  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
----  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
----  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
----})
--
----require("dap").adapters["node"] = {
----	type = "server",
----	host = "localhost",
----	port = "${port}",
----	executable = {
----		command = "node",
----		-- 💀 Make sure to update this path to point to your installation
----		args = { "/home/nima/Applications/jsDebug/js-debug/src/dapDebugServer.js", "${port}" },
----	}
----}
--
--for _, language in ipairs({ "typescript", "javascript" }) do
--	dap.configurations[language] = {
--		{
--			type = 'pwa-node',
--			request = 'launch',
--			name = 'Launch Current File (pwa-node with ts-node)',
--			cwd = vim.fn.getcwd(),
--			runtimeArgs = { '--loader', 'ts-node/esm' },
--			runtimeExecutable = 'node',
--			args = { '${file}' },
--			sourceMaps = true,
--			protocol = 'inspector',
--			skipFiles = { '<node_internals>/**', 'node_modules/**' },
--			resolveSourceMapLocations = {
--				"${workspaceFolder}/**",
--				"!**/node_modules/**",
--			},
--		},
--		{
--			type = "pwa-node",
--			request = "launch",
--			name = "Launch file",
--			program = "${file}",
--			cwd = "${workspaceFolder}",
--		},
--		{
--			type = "node",
--			request = "launch",
--			name = "Launch Program node",
--			skipFiles = {
--				"<node_internals>/**", "src/**/*.spec.ts"
--			},
--			program = "${workspaceFolder}/src/main.ts",
--			preLaunchTask = "tsc: build - tsconfig.json",
--			outFiles = {
--				"${workspaceFolder}/dist/**/*.js"
--			}
--		},
--		--{
--		--	type = "pwa-node",
--		--	request = "launch",
--		--	name = "Launch file",
--		--	program = "${file}",
--		--	cwd = "${workspaceFolder}",
--		--},
--		{
--			type = "pwa-node",
--			request = "attach",
--			name = "Attach",
--			processId = require 'dap.utils'.pick_process,
--			cwd = "${workspaceFolder}",
--		}
--	}
--end
----local terminal = require 'terminal'
--
----vim.api.nvim_create_autocmd("FileType", {
----  pattern = "dap-repl",
----  callback = function(ev)
----    print(string.format('event fired: %s', vim.inspect(ev)))
----    print(string.format('event fired: %s', vim.inspect(ev.buf)))
----    terminal.attach_to_buffer(ev.buff)
----  end
----})
----
----vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
----  pattern = "*.dap-repl",
----  --command = "setl ft=terminal"
----  callback = function(ev)
----    print(string.format('event fired: s', vim.inspect(ev)))
----    terminal.attach_to_buffer(ev.buff)
----  end
----})
---
---

local js_based_languages = {
	"typescript",
	"javascript",
	"typescriptreact",
	"javascriptreact",
	"vue",
}

for _, language in ipairs(js_based_languages) do
	dap.configurations[language] = {
		-- Debug single nodejs files
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
		},
		-- Debug nodejs processes (make sure to add --inspect when you run the process)
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
		},
		-- Debug web applications (client side)
		{
			type = "pwa-chrome",
			request = "launch",
			name = "Launch & Debug Chrome",
			url = function()
				local co = coroutine.running()
				return coroutine.create(function()
					vim.ui.input({
						prompt = "Enter URL: ",
						default = "http://localhost:3000",
					}, function(url)
						if url == nil or url == "" then
							return
						else
							coroutine.resume(co, url)
						end
					end)
				end)
			end,
			webRoot = vim.fn.getcwd(),
			protocol = "inspector",
			sourceMaps = true,
			userDataDir = false,
		},
		{
			type = "node",
			request = "launch",
			name = "Launch Program node",
			skipFiles = {
				"<node_internals>/**", "src/**/*.spec.ts"
			},
			program = "${workspaceFolder}/src/main.ts",
			preLaunchTask = "tsc: build - tsconfig.json",
			outFiles = {
				"${workspaceFolder}/dist/**/*.js"
			}
		},
		-- Divider for the launch.json derived configs
		{
			name = "----- ↓ launch.json configs ↓ -----",
			type = "",
			request = "launch",
		},
	}
end
