return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
		{ "folke/neoconf.nvim", cmd = "Neoconf",                                config = true },
		{ "folke/neodev.nvim",  opts = { experimental = { pathStrict = true } } },
	},

	config = function()
		local lspconfig = require("lspconfig")
		local mason = require("mason")

		mason.setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"clangd",
				"marksman",
				"jsonls",
			},
		})

		require('lspconfig').pyright.setup({})
		require("lspconfig").lua_ls.setup({})
	end,
}
