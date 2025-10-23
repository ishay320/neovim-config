return {
	-- add icons to netrw and git status
	"ishay320/netrw.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	opts = { git = { enable = true } },
}
