return {
	-- show functions signatures
	"ray-x/lsp_signature.nvim",

	event = "VeryLazy",
	opts = { floating_window_off_x = 30 },
	config = function(_, opts)
		require("lsp_signature").setup(opts)

		vim.keymap.set({ "i" }, "<C-k>", function()
			require("lsp_signature").toggle_float_win()
		end, { silent = true, noremap = true, desc = "toggle signature" })
	end,
}
