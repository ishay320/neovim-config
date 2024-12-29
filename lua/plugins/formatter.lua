return {
	-- Autoformat
	"stevearc/conform.nvim",
	lazy = false,
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
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			-- Disable "format_on_save lsp_fallback" for languages that don't
			-- have a well standardized coding style. You can add additional
			-- languages here or re-enable it for the disabled ones.
			local disable_filetypes = { c = true, cpp = true }
			if vim.g.autoformat == false then -- if autoformat if false then do not format
				return
			end
			return {
				timeout_ms = 500,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,
		formatters_by_ft = {
			sh = { "shfmt" },
			lua = { "stylua" },
			cpp = {
				"clang_format",
			},
			c = {
				"clang_format",
			},
		},
		formatters = {
			clang_format = {
				prepend_args = {
					"--style={ BasedOnStyle: Google, IndentWidth: 4, ColumnLimit: 80, AlignConsecutiveAssignments: true, BreakBeforeBraces: Stroustrup}",
				},
			},
		},
	},
}
