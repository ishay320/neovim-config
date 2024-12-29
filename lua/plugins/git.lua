return {
	-- See `:help gitsigns` to understand what the configuration keys do
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 350,
				ignore_whitespace = false,
				virt_text_priority = 100,
			},
		},
	},

	-- ]c               - advance to the next block with differences
	-- [c               - reverse search for the previous block with differences
	-- do (diff obtain) - bring changes from the other file to the current file
	-- dp (diff put)    - send changes from the current file to the other file
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gg", "<cmd>G<cr>", { desc = "[G]it [G]it" })
		end,
	},
}
