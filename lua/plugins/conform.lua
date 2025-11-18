return {
	-- formatting plugin
	"stevearc/conform.nvim",

	event = "VeryLazy",
	opts = {
		notify_on_error = true,
		format_on_save = function(bufnr)
			if vim.g.autoformat == false then
				return false
			end
			-- Disable autoformat on certain filetypes - add "name"
			local ignore_filetypes = {}
			if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
				return
			end
			-- Disable autoformat for files in a certain path
			local bufname = vim.api.nvim_buf_get_name(bufnr)
			if bufname:match("/node_modules/") then
				return
			end
			return { timeout_ms = 500, lsp_format = "fallback" }
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
					"--style={BasedOnStyle: Google, IndentWidth: 4, AlignConsecutiveAssignments: true}",
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
