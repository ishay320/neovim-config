return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = true,
	-- TODO:
	-- - add more terminal at a click
	-- - swap between them example: 3<c-/>
	-- - show the terminals at a click
	opts = {
		vim.keymap.set("n", "", "<cmd>ToggleTerm<cr>", { desc = "Terminal horizontal" }), -- <c-/>
		vim.keymap.set("t", "", "<cmd>ToggleTerm<cr>", { desc = "Terminal horizontal" }), -- <c-/>
		vim.keymap.set("t", "<C-Up>", "<cmd>resize +1<cr>", { desc = "Terminal resize bigger" }),
		vim.keymap.set("t", "<C-Down>", "<cmd>resize -1<cr>", { desc = "Terminal resize smaller" }),
		vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]]),
		vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]]),
		vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]]),
		vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]]),
	},
}
