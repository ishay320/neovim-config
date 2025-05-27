return {
	"tpope/vim-fugitive",

	-- In diff mode, you can use the following commands:
	-- ]c               - advance to the next block with differences
	-- [c               - reverse search for the previous block with differences
	-- do (diff obtain) - bring changes from the other file to the current file
	-- dp (diff put)    - send changes from the current file to the other file
	keys = {
		{
			"<leader>gg",
			"<cmd>Git<cr>",
			desc = "[G]it [G]it",
		},
		{
			"<leader>gP",
			"<cmd>Git push<cr>",
			desc = "[G]it [P]ush",
		},
	},
}
