return {
	-- plugin that properly configures LuaLS for editing your Neovim config by lazily updating your workspace libraries
	"folke/lazydev.nvim",

	ft = "lua", -- only load on lua files
	opts = {
		library = {
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	},
}
