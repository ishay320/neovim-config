return {
	-- Copilot integration for Neovim
	"zbirenbaum/copilot.lua",

	build = ":Copilot auth",
	cmd = "Copilot",

	opts = {
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
	},

	keys = {
		-- Toggle Copilot suggestion with <space>tc
		{
			"<space>tc",
			function()
				if require("copilot.client").is_disabled() then
					require("copilot.command").enable()
				else
					require("copilot.command").disable()
				end
			end,
			desc = "Toggle Copilot Suggestion",
		},
		{
			"<C-right>",
			function()
				require("copilot.suggestion").next()
			end,
			mode = "i",
			desc = "switch to next word suggestion",
		},
		{
			"<C-left>",
			function()
				require("copilot.suggestion").prev()
			end,
			mode = "i",
			desc = "switch to previus word suggestion",
		},
		{
			"<C-]>",
			function()
				require("copilot.suggestion").accept_word()
			end,
			mode = "i",
			desc = "accept next word suggestion",
		},
	},
}
