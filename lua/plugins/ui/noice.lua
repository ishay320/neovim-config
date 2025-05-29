return {
	-- feature-rich notification and command-line UI
	"folke/noice.nvim",

	event = "VeryLazy",
	opts = {
		cmdline = {
			view = "cmdline",
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}
