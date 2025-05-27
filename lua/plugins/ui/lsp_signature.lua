return {
	-- show functions signatures
	"ray-x/lsp_signature.nvim",

	event = "VeryLazy",
	opts = { floating_window_off_x = 30 },
	keys = {
		{
			"<C-k>",
			function()
				require("lsp_signature").toggle_float_win()
			end,
			mode = "i",
			desc = "Toggle signature",
		},
	},
}
