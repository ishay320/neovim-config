-- TODO: add a way to make per project configs that added to the defaults
return {
	-- Debugging adapter protocol client for Neovim
	"mfussenegger/nvim-dap",

	dependencies = {
		-- Debugger UI
		{ "rcarriga/nvim-dap-ui", dependencies = {
			"nvim-neotest/nvim-nio",
		} },
		-- Mason and its DAP extension
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- Setup Mason and Mason DAP
		require("mason").setup()
		require("mason-nvim-dap").setup({
			ensure_installed = { "codelldb", "cpptools", "debugpy" },
			automatic_setup = true,
			handlers = {},
		})

		-- set the breakpoint sign red circle
		vim.cmd([[highlight DapBreakpoint guifg=#FF0000]])
		vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		vim.cmd([[highlight DapBreakpointCondition guifg=#FFA500]])
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "◆", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
		)

		-- Basic debugging keymaps
		vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
		vim.keymap.set("n", "<F8>", dap.terminate, { desc = "Debug: Terminate" })
		vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
		vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
		vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })

		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Debug: Set Breakpoint" })

		-- DAP UI setup
		dapui.setup()
		vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle DAP UI" })

		vim.keymap.set("n", "<Leader>dl", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end, { desc = "Debug: Set Log Point" })
		vim.keymap.set("n", "<Leader>dr", function()
			dap.run_last()
		end, { desc = "Debug: Run Last" })
		vim.keymap.set({ "n", "v" }, "<Leader>dk", function()
			require("dap.ui.widgets").hover()
		end, { desc = "Debug: Hover Variables" })
		vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
			require("dap.ui.widgets").preview()
		end, { desc = "Debug: Preview Variables" })

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		-- C and C++ configs
		for _, language in ipairs({ "c", "cpp" }) do
			dap.configurations[language] = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = true,
				},
				{
					name = "Launch with arguments",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					args = function()
						local input = vim.fn.input("Arguments: ", "", "file")
						return vim.fn.split(input, " ", true)
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = true,
				},
				{
					name = "Attach to process",
					type = "codelldb",
					request = "attach",
					pid = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
			}
		end
		-- Python config
		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Launch python file",
				program = "${file}",
				pythonPath = function()
					return "python"
				end,
				stopOnEntry = true,
			},
		}
	end,
}
