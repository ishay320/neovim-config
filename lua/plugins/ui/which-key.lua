return {
	-- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",

	event = "VeryLazy",
	config = function()
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
			{ "<leader>t", group = "[T]oggle" },
			{ "<leader>t_", hidden = true },
			{ "<leader>x", group = "Troble" },
			{ "<leader>x_", hidden = true },
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
			{ "gr", desc = "Lsp options" },
			{ "gr_", hidden = true },
		})
	end,
}
