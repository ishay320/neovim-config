local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
		{
			"catppuccin/nvim",
			name = "catppuccin",
			priority = 1000
		},
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			init = function()
				vim.o.timeout = true
				vim.o.timeoutlen = 300
			end,
			opts = {}
		},
		{ "folke/neoconf.nvim",       cmd = "Neoconf" },
		"folke/neodev.nvim",
		require('core.lsp'),
		{ 'nvim-lualine/lualine.nvim' }, -- set the line at the buttom to be more informative
		'lewis6991/gitsigns.nvim',
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				local configs = require("nvim-treesitter.configs")

				configs.setup({
					auto_install = true,
					modules = {},
					ignore_install = {},
					ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "javascript", "html" },
					sync_install = false,
					highlight = { enable = true },
					indent = { enable = true },
				})
			end
		},
		'HiPhish/rainbow-delimiters.nvim',
		{
			'nvim-telescope/telescope.nvim',
			branch = '0.1.x',
			dependencies = { 'nvim-lua/plenary.nvim' }
		},
		{
			"kdheepak/lazygit.nvim",
			-- optional for floating window border decoration
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},
		{
			"folke/todo-comments.nvim",
			dependencies = { "nvim-lua/plenary.nvim" },
			opts = {}
		},
		"tpope/vim-commentary",
		{
			'akinsho/toggleterm.nvim',
			version = "*",
			config = true
		},
	},

	{
		install = {
			colorscheme = {
				'catppuccin',
			}
		}
	}
)
