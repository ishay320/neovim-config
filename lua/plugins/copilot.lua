return {
	"zbirenbaum/copilot.lua",
	build = ":Copilot auth",
	event = "BufReadPost",
	cmd = "Copilot",

	config = function()
		require("copilot").setup({
			panel = {
				enabled = false,
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<Tab>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-e>",
				},
			},
			logger = {
				file = vim.fn.stdpath("log") .. "/copilot-lua.log",
				file_log_level = vim.log.levels.OFF,
				print_log_level = vim.log.levels.ERROR,
				trace_lsp = "off", -- "off" | "messages" | "verbose"
				trace_lsp_progress = false,
				log_lsp_messages = false,
			},
		})

		-- Start with Copilot disabled
		vim.cmd("Copilot disable")

		-- Toggle Copilot suggestion with <space>tc
		local copilot_enabled = false
		vim.keymap.set("n", "<space>tc", function()
			if copilot_enabled then
				-- Disable Copilot suggestions
				vim.cmd("Copilot disable")
				copilot_enabled = false
				print("Copilot disabled")
			else
				-- Enable Copilot suggestions
				vim.cmd("Copilot enable")
				copilot_enabled = true
				print("Copilot enabled")
			end
		end, { desc = "Toggle Copilot Suggestion" })
	end,
}
