return {
	-- plugin that show quicklist of diagnostics, symbols etc
	"folke/trouble.nvim",

	cmd = "Trouble",
	opts = {},
	keys = {
		{
			"<leader>xs",
			function()
				require("trouble").toggle("symbols")
			end,
			desc = "Toggle [S]ymbols (Trouble)",
		},
		{
			"<leader>xx",
			function()
				require("trouble").toggle("diagnostics")
			end,
			desc = "Toggle [D]iagnostics (Trouble)",
		},
		{
			"<leader>xt",
			function()
				require("trouble").toggle("todo")
			end,
			desc = "Toggle [T]odo (Trouble)",
		},
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
}
