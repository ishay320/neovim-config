return {
	-- markdown view in normal mode
	"OXY2DEV/markview.nvim",

	lazy = false,
	priority = 49,

	opts = {
		preview = {
			linewise_hybrid_mode = true,
			hybrid_modes = { "n" },
		},
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}
