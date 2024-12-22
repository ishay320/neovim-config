return {
	{ -- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			local wk = require("which-key")
			wk.setup()
			wk.add({
				{ "<leader>c", group = "[C]ode" },
				{ "<leader>c_", hidden = true },
				{ "<leader>d", group = "[D]ocument" },
				{ "<leader>d_", hidden = true },
				{ "<leader>f", group = "[F]inde" },
				{ "<leader>f_", hidden = true },
				{ "<leader>r", group = "[R]ename" },
				{ "<leader>r_", hidden = true },
				{ "<leader>w", group = "[W]orkspace" },
				{ "<leader>w_", hidden = true },
				{ "<leader>g", group = "[G]it" },
				{ "cr", desc = "abolish replace case" },
				{ "cr-", desc = "dash-case" },
				{ "cr.", desc = "dot.case" },
				{ "crU", desc = "SNAKE_UPPERCASE" },
				{ "cr_", desc = "snake_case" },
				{ "crc", desc = "camelCase" },
				{ "crk", desc = "kebab-case" },
				{ "crm", desc = "MixedCase" },
				{ "crp", desc = "PascalCase" },
				{ "crs", desc = "snake_case" },
				{ "cru", desc = "SNAKE_UPPERCASE" },
			})
		end,
	},

	{
		"OXY2DEV/markview.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},

	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = { floating_window_off_x = 30 },
		config = function(_, opts)
			require("lsp_signature").setup(opts)

			vim.keymap.set({ "i" }, "<C-k>", function()
				require("lsp_signature").toggle_float_win()
			end, { silent = true, noremap = true, desc = "toggle signature" })
		end,
	},

	{ -- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},

	{ "HiPhish/rainbow-delimiters.nvim", opt = {} },

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			-- integration of indent blankline and rainbow delimiters
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}
			local hooks = require("ibl.hooks")
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			end)

			vim.g.rainbow_delimiters = { highlight = highlight }
			require("ibl").setup({ scope = { highlight = highlight } })

			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		end,
	},
}
