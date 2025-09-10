return {
	-- Provides configurations for Neovim's built-in LSP client
	"neovim/nvim-lspconfig",

	dependencies = {
		{
			"williamboman/mason.nvim", -- LSP DAP linter and formatter installer plugin
			opts = {
				ui = {
					icons = {
						package_pending = " ",
						package_installed = " ",
						package_uninstalled = " ",
					},
				},
			},
			max_concurrent_installers = 10,
		},
		"williamboman/mason-lspconfig.nvim", -- glue between mason and lspconfig
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- auto install list of LSP servers

		{ "j-hui/fidget.nvim", opts = {} }, -- Useful status updates for LSP
	},

	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			desc = "attach keymaps to lsp enabled buffer",
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- Jump to the definition of the word under your cursor
				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

				--  Go to declaration of the word under your cursor
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				-- Jump to the implementation of the word under your cursor
				map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

				-- Jump to the type of the word under your cursor
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

				-- Fuzzy find all the symbols in your current document
				map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")

				-- Fuzzy find all the symbols in your current workspace
				map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")

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
						desc = "highlight references when the cursor is idle",
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.clear_references,
						desc = "clear highlight from all the references when the cursor moves",
					})
				end
			end,
		})

		-- Servers to be install and their opts
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
			prettier = {},
			basedpyright = {
				settings = {
					basedpyright = {
						analysis = {
							autoImportCompletions = true,
							autoSearchPaths = true,
							typeCheckingMode = "standard",
							useLibraryCodeForTypes = true,
							reportMissingImports = true,
						},
					},
				},
			},
			black = {},
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

		-- Ensure the tools are installed
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Format Lua code
			"bash-language-server", -- bash LSP
			"shfmt", -- shell formatter
		})

		-- Ensure the servers and tools above are installed
		require("mason").setup()
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed }) -- install servers

		-- configure the servers using the table above
		for server_name, config in pairs(servers) do
			vim.lsp.config(server_name, config)
		end

		-- NOTE: I can use `vim.lsp.enable(server_name)` but for :LspInstall servers it wont work
		require("mason-lspconfig").setup({
			ensure_installed = {},
			automatic_enable = true,
		})

		-- Diagnostic Config
		-- See :help vim.diagnostic.Opts
		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = vim.g.have_nerd_font and {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			} or {},
			virtual_text = {
				source = "if_many",
				spacing = 2,
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = diagnostic.message,
						[vim.diagnostic.severity.WARN] = diagnostic.message,
						[vim.diagnostic.severity.INFO] = diagnostic.message,
						[vim.diagnostic.severity.HINT] = diagnostic.message,
					}
					return diagnostic_message[diagnostic.severity]
				end,
			},
		})
	end,
}
