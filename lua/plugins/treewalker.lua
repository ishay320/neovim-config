return {
	-- plugin for moving/swapping blocks on the code tree
	"aaronik/treewalker.nvim",

	opts = {},
	keys = {
		-- movement
		{ "<C-M-k>", "<cmd>Treewalker Up<cr>", mode = { "n", "v" }, silent = true },
		{ "<C-M-j>", "<cmd>Treewalker Down<cr>", mode = { "n", "v" }, silent = true },
		{ "<C-M-h>", "<cmd>Treewalker Left<cr>", mode = { "n", "v" }, silent = true },
		{ "<C-M-l>", "<cmd>Treewalker Right<cr>", mode = { "n", "v" }, silent = true },

		-- swapping
		{ "<S-M-k>", "<cmd>Treewalker SwapUp<cr>", mode = "n", silent = true },
		{ "<S-M-j>", "<cmd>Treewalker SwapDown<cr>", mode = "n", silent = true },
		{ "<S-M-h>", "<cmd>Treewalker SwapLeft<cr>", mode = "n", silent = true },
		{ "<S-M-l>", "<cmd>Treewalker SwapRight<cr>", mode = "n", silent = true },
	},
}
