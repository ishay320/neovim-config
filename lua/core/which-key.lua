local wk = require("which-key")


wk.register({
	["<leader>"] = {
		f = {
			name = "+file+Telescope",
			f = { "<cmd>Telescope find_files<cr>", "Find File" },
			r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
			g = { "Live Grep" },
			h = { "Help Search" },
			b = { "Buffer Search" },
			n = { "<cmd>enew<cr>", "New File" },
		},
		g = {
			name = "+git",
			g = { "LazyGit" },
		},
		q = { "Diagnostics" },
	},
})
