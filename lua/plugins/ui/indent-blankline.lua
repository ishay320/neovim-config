return {
	-- show color for indent same as rainbow_delimiters but for indent lines
	"lukas-reineke/indent-blankline.nvim",

	main = "ibl",
	config = function()
		-- integration of indent blankline and rainbow delimiters
		local highlight = {
			"RainbowDelimiterRed",
			"RainbowDelimiterYellow",
			"RainbowDelimiterBlue",
			"RainbowDelimiterOrange",
			"RainbowDelimiterGreen",
			"RainbowDelimiterViolet",
			"RainbowDelimiterCyan",
		}
		local hooks = require("ibl.hooks")
		require("ibl").setup({
			indent = { char = "┋" },
			scope = { highlight = highlight },
		})

		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end,
}
