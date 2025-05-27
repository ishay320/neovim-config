return {
	-- See `:help gitsigns` to understand what the configuration keys do
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
}
