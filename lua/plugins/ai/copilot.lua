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
				accept = "<M-l>",
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
		{
			"<space>tc",
			function()
				vim.cmd("Copilot toggle")
			end,
			desc = "Toggle Copilot Suggestion",
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
