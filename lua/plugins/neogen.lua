return {
	-- Code annotation generator
	"danymat/neogen",

	opts = {
		snippet_engine = "luasnip",
		enable_placeholders = false,
		input_after_comment = true,
	},
	keys = {
		{
			"<leader>n",
			function()
				require("neogen").generate()
			end,
			desc = "[N]eogen (annotations)",
		},
	},
}
