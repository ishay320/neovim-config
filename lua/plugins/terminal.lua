return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = true,
	-- TODO:
	-- - add more terminal at a click
	-- - swap between them example: 3<c-/>
	-- - show the terminals at a click
	opts = {
		-- Keymaps for opening/closing terminal
		vim.keymap.set("n", "<C-_>", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal (Normal)" }),
		vim.keymap.set("t", "<C-_>", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal (Terminal)" }),

		vim.keymap.set("n", "<C-/>", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal (Normal, Ghostty)" }),
		vim.keymap.set("t", "<C-/>", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal (Terminal, Ghostty)" }),

		-- Resize terminal
		vim.keymap.set("t", "<C-Up>", "<cmd>resize +1<cr>", { desc = "Increase Terminal Height" }),
		vim.keymap.set("t", "<C-Down>", "<cmd>resize -1<cr>", { desc = "Decrease Terminal Height" }),

		-- Terminal window navigation
		vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Move Left" }),
		vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Move Down" }),
		vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Move Up" }),
		vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Move Right" }),
	},
}
