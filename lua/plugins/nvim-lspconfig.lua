return {
	-- Provides configurations for Neovim's built-in LSP client
	"neovim/nvim-lspconfig",

	dependencies = {
		-- Automatically install LSPs and related tools to stdpath for Neovim
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Useful status updates for LSP
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- Jump to the definition of the word under your cursor
				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

				--  Go to declaration of the word under your cursor
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				-- Find references for the word under your cursor
				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

				-- Jump to the implementation of the word under your cursor
				map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

				-- Jump to the type of the word under your cursor
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

				-- Fuzzy find all the symbols in your current document
				map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

				-- Fuzzy find all the symbols in your current workspace
				map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

				-- Rename the variable under your cursor.
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

				-- Execute a code action, usually your cursor needs to be on top of an error
				-- or a suggestion from your LSP for this to activate.
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				-- Opens a popup that displays documentation about the word under your cursor
				map("K", vim.lsp.buf.hover, "Hover Documentation")

				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				--    See `:help CursorHold` for information about when this is executed
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.clear_references,
					})
				end
			end,
		})

		-- LSP servers and clients are able to communicate to each other what features they support.
		--  By default, Neovim doesn't support everything that is in the LSP specification.
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		-- Enable the following language servers
		local servers = {
			clangd = {
				cmd = {
					"clangd",
					"--all-scopes-completion",
					"--background-index",
					"--clang-tidy",
					"--compile_args_from=filesystem", -- lsp-> does not come from compie_commands.json
					"--completion-parse=always",
					"--completion-style=bundled",
					"--cross-file-rename",
					"--debug-origin",
					"--enable-config", -- clangd 11+ supports reading from .clangd configuration file
					"--fallback-style=Qt",
					"--folding-ranges",
					"--function-arg-placeholders",
					"--header-insertion=iwyu",
					"--pch-storage=memory", -- could also be disk
					"--suggest-missing-includes",
					"-j=4", -- number of workers
					-- "--resource-dir="
					"--log=error",
					--[[ "--query-driver=/usr/bin/g++", ]]
				},
			},
			black = {},
			prettier = {},
			pyright = {},
			lua_ls = {
				settings = {
					Lua = {
						completion = { callSnippet = "Replace" },
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			},
		}

		-- Ensure the servers and tools above are installed
		require("mason").setup()

		-- Ensure the tools are installed
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Format Lua code
			"bash-language-server",
			"shfmt",
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		-- Setup Mason LSPconfig with automatic installation and handler
		require("mason-lspconfig").setup({
			automatic_installation = true,
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					-- This handles overriding only values explicitly passed
					-- by the server configuration above.
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
