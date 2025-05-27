return {
	"tpope/vim-fugitive",

	-- ]c               - advance to the next block with differences
	-- [c               - reverse search for the previous block with differences
	-- do (diff obtain) - bring changes from the other file to the current file
	-- dp (diff put)    - send changes from the current file to the other file
	config = function()
		vim.keymap.set("n", "<leader>gg", "<cmd>G<cr>", { desc = "[G]it [G]it" })
	end,
}
