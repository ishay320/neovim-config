-- function that creating the text of the suggestion
local format_func = function(_, vim_item, short)
	local kind_icons = {
		Text = "󰉿",
		Method = "󰆧",
		Function = "󰊕",
		Constructor = "",
		Field = "󰜢",
		Variable = "󰀫",
		Class = "󰠱",
		Interface = "",
		Module = "",
		Property = "󰜢",
		Unit = "󰑭",
		Value = "󰎠",
		Enum = "",
		Keyword = "󰌋",
		Snippet = "",
		Color = "󰏘",
		File = "󰈙",
		Reference = "󰈇",
		Folder = "󰉋",
		EnumMember = "",
		Constant = "󰏿",
		Struct = "󰙅",
		Event = "",
		Operator = "󰆕",
		TypeParameter = "󰅲",
	}

	if short then
		vim_item.kind = string.format("%s", kind_icons[vim_item.kind] or "")
	else
		vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind] or "", vim_item.kind)
	end
	return vim_item
end

return {
	-- Autocompletion
	"hrsh7th/nvim-cmp",

	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		-- Snippet Engine & its associated nvim-cmp source
		{
			"L3MON4D3/LuaSnip",
			build = (function()
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {
				-- `friendly-snippets` contains a variety of premade snippets.
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()

						require("luasnip").filetype_extend("sh", { "shelldoc" })
						require("luasnip").filetype_extend("lua", { "luadoc" })
						require("luasnip").filetype_extend("python", { "pydoc" })
						require("luasnip").filetype_extend("c", { "cdoc" })
						require("luasnip").filetype_extend("cpp", { "cppdoc" })
					end,
				},
			},
		},
		-- glue plugin that connect the LuaSnip plugin with the nvim-cmp
		"saadparwaiz1/cmp_luasnip",

		-- Adds other completion capabilities
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-calc",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-buffer",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		luasnip.config.setup({})

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = { completeopt = "menu,menuone,noinsert" },

			-- Add circular borders to completion and documentation windows
			window = {
				completion = {
					border = "rounded",
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
				},
				documentation = {
					border = "rounded",
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
				},
			},
			formatting = {
				fields = { "abbr", "kind" },
				format = function(entry, vim_item)
					return format_func(entry, vim_item, false)
				end,
			},

			-- Smart sorting based on context
			-- sorting = {
			-- 	priority_weight = 2,
			-- 	comparators = {
			-- 		cmp.config.compare.offset,
			-- 		cmp.config.compare.exact,
			-- 		cmp.config.compare.score,
			-- 		cmp.config.compare.recently_used,
			-- 		cmp.config.compare.locality,
			-- 		cmp.config.compare.kind,
			-- 		cmp.config.compare.sort_text,
			-- 		cmp.config.compare.length,
			-- 		cmp.config.compare.order,
			-- 	},
			-- },

			mapping = cmp.mapping.preset.insert({
				-- Select the [n]ext item
				["<C-n>"] = cmp.mapping.select_next_item(),
				-- Select the [p]revious item
				["<C-p>"] = cmp.mapping.select_prev_item(),

				-- Scroll the documentation window [b]ack / [f]orward
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),

				-- Accept ([y]es) the completion.
				--  This will auto-import if your LSP supports it.
				--  This will expand snippets if the LSP sent a snippet.
				["<C-y>"] = cmp.mapping.confirm({ select = true }),

				-- Manually trigger a completion from nvim-cmp.
				["<C-Space>"] = cmp.mapping.complete({}),

				-- <c-l> will move you to the right of each of the expansion locations.
				-- <c-h> is similar, except moving you backwards.
				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),

				-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
				--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "calc" },
				{ name = "lazydev", group_index = 0 }, -- from the 'lazydev.lua' file
				{ name = "buffer", keyword_length = 4 }, -- start suggesting words when it is bigger then 4 chars
			},
		})

		cmp.setup.cmdline("/", {
			mapping = {
				["<C-Space>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.abort()
					else
						cmp.complete()
					end
				end, { "c" }),
				["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
				["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c" }),
				["<C-y>"] = cmp.mapping(function()
					if cmp.visible() then
						cmp.confirm({ select = false })
					else
						vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-y>", true, false, true), "n", true)
					end
				end, { "c" }),
			},
			sources = {
				{ name = "buffer" },
			},
			completion = { autocomplete = false },
			formatting = {
				format = function(entry, vim_item)
					return format_func(entry, vim_item, true)
				end,
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline({
				["<Tab>"] = cmp.mapping(function(_)
					if cmp.visible() then
						return cmp.select_next_item()
					end
					cmp.complete()
					-- select the first one, don't know why, but it need to be called twice for some situations
					cmp.select_next_item({ count = 0 })
					cmp.select_next_item({ count = 0 })
				end, { "c" }),
			}),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
			matching = { disallow_symbol_nonprefix_matching = false },
			completion = { autocomplete = false },
			formatting = {
				format = function(entry, vim_item)
					return format_func(entry, vim_item, true)
				end,
			},
		})
	end,
}
