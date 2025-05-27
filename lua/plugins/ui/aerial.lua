return {
	-- Aerial plugin for document symbols and navigation
	"stevearc/aerial.nvim",

	opts = {},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>ta", "<cmd>AerialToggle!<CR>", desc = "[A]erial" },
	},
}
