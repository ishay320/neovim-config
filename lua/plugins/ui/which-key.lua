return {
	-- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",

	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup()
		wk.add({
			{ "<leader>d", group = "[D]ocument", icon = "󰈙" },
			{ "<leader>d_", hidden = true },
			{ "<leader>f", group = "[F]ind", icon = "" },
			{ "<leader>f_", hidden = true },
			{ "<leader>g", group = "[G]it", icon = "" },
			{ "<leader>g_", hidden = true },
			{ "<leader>t", group = "[T]oggle", icon = "" },
			{ "<leader>t_", hidden = true },
			{ "<leader>x", group = "Trouble", icon = "󱍼" },
			{ "<leader>x_", hidden = true },
			{ "cr", desc = "abolish replace case", icon = "󰬶" },
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
			{ "gr", desc = "Lsp options", icon = "" },
			{ "gr_", hidden = true },
		})
	end,
}
