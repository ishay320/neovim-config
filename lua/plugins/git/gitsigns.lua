return {
	-- plugin that shows signs inline of who committed that line
	"lewis6991/gitsigns.nvim",

	event = { "BufReadPre", "BufNewFile" },

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
	keys = {
		{
			"[h",
			function()
				require("gitsigns").nav_hunk("prev")
			end,
			desc = "Go to previews git [H]unk",
		},
		{
			"]h",
			function()
				require("gitsigns").nav_hunk("next")
			end,
			desc = "Go to next git [H]unk",
		},
		{
			"<leader>gi",
			function()
				require("gitsigns").preview_hunk_inline()
			end,
			desc = "[G]it [I]nline preview",
		},
		{
			"<leader>gp",
			function()
				require("gitsigns").preview_hunk()
			end,
			desc = "[G]it [P]review",
		},
		{
			"<leader>gr",
			function()
				require("gitsigns").reset_hunk()
			end,
			desc = "[G]it [R]eset hunk",
		},
		{
			"<leader>gR",
			function()
				require("gitsigns").reset_buffer()
			end,
			desc = "[G]it [R]eset buffer",
		},
		{
			"<leader>gs",
			function()
				require("gitsigns").stage_hunk()
			end,
			desc = "[G]it [S]tage hunk",
		},
		{
			"<leader>gS",
			function()
				require("gitsigns").stage_buffer()
			end,
			desc = "[G]it [S]tage buffer",
		},
		{
			"<leader>gu",
			function()
				require("gitsigns").undo_stage_hunk()
			end,
			desc = "[G]it [U]ndo stage hunk",
		},
		{
			"<leader>gb",
			function()
				require("gitsigns").blame_line()
			end,
			desc = "[G]it [B]lame line",
		},
		{
			"<leader>gd",
			function()
				require("gitsigns").diffthis()
			end,
			desc = "[G]it [D]iff this",
		},
		{
			"<leader>gD",
			function()
				require("gitsigns").diffthis("~")
			end,
			desc = "[G]it [D]iff this (HEAD)",
		},
		{
			"<leader>gB",
			function()
				require("gitsigns").blame_line({ full = true })
			end,
			desc = "[G]it [B]lame line (full)",
		},
	},
}
