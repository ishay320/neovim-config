-- [[ Core Configuration ]]
require("core.configurations")
require("core.keymaps")
require("core.autocommands")

-- [[ Plugin Management ]]
require("plugins.lazy")

-- [[ Configure Plugins ]]
require("lazy").setup({

	-- Import plugin modules
	require("plugins.utils"),
	require("plugins.git"),
	require("plugins.ui"),
	require("plugins.telescope"),
	require("plugins.terminal"),
	require("plugins.lsp"),
	require("plugins.formatter"),
	require("plugins.autocomplete"),
	require("plugins.colorscheme"),
	require("plugins.treesitter"),

	-- require 'kickstart.plugins.debug',
	-- require 'kickstart.plugins.indent_line',
	-- require 'kickstart.plugins.lint',
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
