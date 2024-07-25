return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"mfussenegger/nvim-dap-python",
		"jay-babu/mason-nvim-dap.nvim",
	},

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local widgets = require("dap.ui.widgets")
		local dap_python = require("dap-python")
		local mason_dap = require("mason-nvim-dap")

		mason_dap.setup({
			ensure_installed = {
				"debugpy",
				"php-debug-adapter",
			},
		})

		dapui.setup()

		dap_python.setup("~/.venv/debugpy/Scripts/python")
		table.insert(dap.configurations.python, {
			type = "python",
			request = "launch",
			name = "Module",
			console = "integratedTerminal",
			-- module = "src", -- edit this to be your app's main module
			cwd = "${workspaceFolder}",
		})

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start debug session" })
		vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Run for one step" })
		vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step into function/method" })
		vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step out of function/method" })
		vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Debugging [t]oggle breakpoint" })
		vim.keymap.set({ "n", "v" }, "<leader>dp", widgets.preview, { desc = "Debugging [p]review expression" })
	end,
}
