return {
	-- formatting plugin
	"stevearc/conform.nvim",

	event = "VeryLazy",
	opts = {
		notify_on_error = true,
		format_on_save = function(bufnr)
			-- Disable format_on_save for languages in that list
			local disable_filetypes = { c = false, cpp = false }
			if vim.g.autoformat == false then -- if autoformat is false then do not format
				return
			end
			return {
				timeout_ms = 500,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,
		formatters_by_ft = {
			-- NOTE: if added new formatter, autoinstall it in 'nvim-lspconfig.lua'
			sh = { "shfmt" },
			lua = { "stylua" },
			cpp = { "clang_format" },
			c = { "clang_format" },
			python = { "black" },
			markdown = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			javascript = { "prettier" },
			typescript = { "prettier" },
		},
		-- formatters configurations
		formatters = {
			clang_format = {
				prepend_args = {
					"--style={ BasedOnStyle: Google, IndentWidth: 4, ColumnLimit: 80, AlignConsecutiveAssignments: true, BreakBeforeBraces: Stroustrup}",
				},
			},
		},
	},

	keys = {
		{
			"<A-F>",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
}
