return {
	"malewicz1337/oil-git.nvim",
	opts = {},
	dependencies = {
		"stevearc/oil.nvim",
		opts = {
			view_options = {
				show_hidden = true,
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
	},
}
