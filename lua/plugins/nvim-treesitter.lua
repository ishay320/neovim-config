return {

	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,

		branch = "main",
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")
			-- Install parsers on startup (non-blocking)
			local parsers_to_install = {
				"astro",
				"bash",
				"c",
				"css",
				"diff",
				"go",
				"gomod",
				"gowork",
				"gosum",
				"graphql",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
				"ruby",
				"gitcommit",
			}

			-- Install async without waiting
			vim.schedule(function()
				ts.install(parsers_to_install)
			end)

			-- Enable highlighting for each filetype
			for _, parser in ipairs(parsers_to_install) do
				vim.api.nvim_create_autocmd("FileType", {
					pattern = parser,
					callback = function(event)
						pcall(vim.treesitter.start, event.buf, parser)
					end,
				})
			end

			-- Auto-install missing parsers when opening new filetypes
			vim.api.nvim_create_autocmd("FileType", {
				callback = function(event)
					local bufnr = event.buf
					local filetype = vim.bo[bufnr].filetype

					-- Skip if no filetype
					if filetype == "" then
						return
					end

					local parser_name = vim.treesitter.language.get_lang(filetype) or filetype
					local has_parser = pcall(vim.treesitter.get_parser, bufnr, parser_name)

					if not has_parser then
						-- Check if parser exists in registry
						local parsers = require("nvim-treesitter.parsers")
						if parsers[parser_name] then
							-- Defer installation to not block the FileType event
							vim.defer_fn(function()
								vim.notify(
									string.format("Installing parser for %s...", parser_name),
									vim.log.levels.INFO,
									{ title = "Treesitter" }
								)
								ts.install({ parser_name })
							end, 0) -- Run immediately but asynchronously
						end
					else
						pcall(vim.treesitter.start, bufnr, parser_name)
					end
				end,
			})
		end,
		dependencies = {
			"OXY2DEV/markview.nvim",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufRead",
		dependencies = "nvim-treesitter/nvim-treesitter",
		opts = {
			multiwindow = true,
			multiline_threshold = 1,
		},
	},
}
