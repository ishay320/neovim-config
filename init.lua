-- [[ Core Configuration ]]
require("core.configurations")
require("core.keymaps")
require("core.autocommands")

-- [[ Configure Plugins ]]
require("lazy_init")
require("lazy").setup({
	spec = {
		{ import = "plugins" },
		{ import = "plugins.ai" },
		{ import = "plugins.git" },
		{ import = "plugins.ui" },
	},
	change_detection = { notify = false },
	install = { colorscheme = { "catppuccin-mocha" } },
})

require("venv")
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
