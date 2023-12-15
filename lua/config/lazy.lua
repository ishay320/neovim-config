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

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
	{ -- colorscheme
		"folke/tokyonight.nvim",
		lazy = false, -- load during startup 
		priority = 1000, -- load this before all the other plugins
	},

	{'nvim-lualine/lualine.nvim'}, -- set the line at the buttom to be more informative

	{ -- show popup of what key can be pressed next
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {}
	},

	require("config.lsp"), -- lsp configurations

	require("config.cmp"),

	{ -- create popup terminal
	'akinsho/toggleterm.nvim',
	config = function()
		require("toggleterm").setup()
	end
	},

	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	'airblade/vim-gitgutter',

	{
		'stevearc/conform.nvim',
		opts = {},
	},

	require("config.formatter"),

	{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
		  auto_install = true,
		  modules = {},
		  ignore_install = {},
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
 	},

	'HiPhish/nvim-ts-rainbow2',
})
