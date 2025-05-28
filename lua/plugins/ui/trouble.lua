return {
	-- change trouble config
	"folke/trouble.nvim",

	cmd = "Trouble",
	opts = { use_diagnostic_signs = true },
	keys = {
		{
			"<leader>xs",
			function()
				require("trouble").toggle("symbols")
			end,
			desc = "Toggle [S]ymbols (Trouble)",
		},
		{
			"<leader>xd",
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
	},
}
