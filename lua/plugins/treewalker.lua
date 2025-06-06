return {
	"aaronik/treewalker.nvim",
	opts = {},
	keys = {
		-- movement
		{ "<C-M-k>", "<cmd>Treewalker Up<cr>", mode = { "n", "v" }, silent = true },
		{ "<C-M-j>", "<cmd>Treewalker Down<cr>", mode = { "n", "v" }, silent = true },
		{ "<C-M-h>", "<cmd>Treewalker Left<cr>", mode = { "n", "v" }, silent = true },
		{ "<C-M-l>", "<cmd>Treewalker Right<cr>", mode = { "n", "v" }, silent = true },

		-- swapping
		{ "<M-S-k>", "<cmd>Treewalker SwapUp<cr>", mode = "n", silent = true },
		{ "<M-S-j>", "<cmd>Treewalker SwapDown<cr>", mode = "n", silent = true },
		{ "<M-S-h>", "<cmd>Treewalker SwapLeft<cr>", mode = "n", silent = true },
		{ "<M-S-l>", "<cmd>Treewalker SwapRight<cr>", mode = "n", silent = true },
	},
}
