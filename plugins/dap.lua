local utils = require("astronvim.utils")

return {
	{
		"rcarriga/nvim-dap-ui",
		keys = {
			{
				"<leader>dS",
				function()
					require("dapui").open({ reset = true })
				end,
				desc = "Resize windows",
			},
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = function(_, opts)
			opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, {})
			return opts
		end,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"microsoft/vscode-js-debug",
				build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
				version = "1.*",
			},
			{
				"mxsdev/nvim-dap-vscode-js",
				lazy = false,
				config = function()
					---@diagnostic disable-next-line: missing-fields
					require("dap-vscode-js").setup({
						debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
						adapters = {
							"pwa-node",
							"pwa-chrome",
							"pwa-msedge",
							"pwa-extensionHost",
							"node-terminal",
						},
					})
				end,
			},
		},
		config = function()
			local dap = require("dap")

			for _, language in ipairs(astronvim.user_opts("utils.constants").filetype.javascript) do
				dap.configurations[language] = {
					{
						name = "Next.js: debug server-side",
						type = "node-terminal",
						request = "launch",
						command = "yarn dev",
					},
					{
						name = "Next.js: debug full stack",
						type = "node-terminal",
						request = "launch",
						command = "npm run dev",
						serverReadyAction = {
							pattern = "- Local:.+(https?://.+)",
							uriFormat = "%s",
							action = "debugWithChrome",
						},
					},
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file",
						program = "${file}",
						cwd = "${workspaceFolder}",
						sourceMaps = true,
					},
					-- Debug nodejs processes (make sure to add --inspect when you run the process)
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach",
						processId = require("dap.utils").pick_process,
						cwd = "${workspaceFolder}",
						sourceMaps = true,
					},
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch Test Program (pwa-node with vitest)",
						cwd = "${workspaceFolder}",
						program = "${workspaceFolder}/node_modules/vitest/vitest.mjs",
						args = { "run", "${file}" },
						autoAttachChildProcesses = true,
						smartStep = true,
						skipFiles = { "<node_internals>/**", "node_modules/**" },
					},
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
						webRoot = "${workspaceFolder}",
						skipFiles = { "<node_internals>/**", "node_modules/**" },
						sourceMaps = true,
						resolveSourceMapLocations = {
							"${workspaceFolder}/**",
							"!**/node_modules/**",
						},
					},
					{
						name = "React native",
						type = "node2",
						request = "attach",
						program = "${file}",
						cwd = "${workspaceFolder}",
						sourceMaps = true,
						protocol = "inspector",
						console = "integratedTerminal",
						port = 35000,
					},
					-- Divider for the launch.json derived configs
					{
						name = "----- ↓ launch.json configs ↓ -----",
						type = "",
						request = "launch",
					},
				}
			end
		end,
	},
}
