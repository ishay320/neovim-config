return {
	-- Catppuccin theme for Neovim with complete LSP semantic highlights
	"catppuccin/nvim",
	priority = 1000,
	opts = {
		flavour = "mocha",
		auto_integrations = true,
		custom_highlights = function(colors)
			return {
				-- ============================================================
				-- CORE SEMANTIC TOKEN TYPES
				-- ============================================================

				-- Enum Members
				["@lsp.type.enumMember"] = { fg = "#94e2d5" }, -- teal

				-- Keywords
				["@lsp.type.selfKeyword"] = { fg = "#f38ba8" }, -- red
				["@lsp.type.keyword"] = { fg = colors.mauve },

				-- Primitives
				["@lsp.type.boolean"] = { fg = "#fab387" }, -- peach
				["@lsp.type.number"] = { fg = "#fab387" }, -- peach
				["@lsp.type.string"] = { fg = colors.green },

				-- Variables
				["@lsp.type.variable"] = { fg = colors.text },
				["@lsp.type.variable.defaultLibrary"] = { fg = "#eba0ac" }, -- maroon
				["@lsp.type.parameter"] = { fg = colors.maroon, italic = true },
				["@lsp.type.property"] = { fg = colors.text },

				-- Functions & Methods
				["@lsp.type.function"] = { fg = colors.blue, italic = true },
				["@lsp.type.method"] = { fg = colors.blue, italic = true },
				["@lsp.type.macro"] = { fg = colors.mauve },
				["@lsp.type.decorator"] = { fg = colors.blue },

				-- Types
				["@lsp.type.type"] = { fg = colors.yellow, italic = true },
				["@lsp.type.class"] = { fg = colors.yellow, italic = true },
				["@lsp.type.struct"] = { fg = colors.yellow, italic = true },
				["@lsp.type.interface"] = { fg = colors.yellow, italic = true },
				["@lsp.type.enum"] = { fg = colors.yellow, italic = true },
				["@lsp.type.typeParameter"] = { fg = colors.maroon },

				-- Namespaces & Modules
				["@lsp.type.namespace"] = { fg = colors.yellow },
				["@lsp.type.module"] = { fg = colors.yellow },

				-- Comments & Documentation
				["@lsp.type.comment"] = { fg = colors.overlay0, italic = true },
				["@lsp.type.comment.documentation"] = { fg = colors.overlay2, italic = true },

				-- ============================================================
				-- PYTHON-SPECIFIC
				-- ============================================================

				["@lsp.type.class.python"] = { fg = "#f9e2af" }, -- yellow
				["@lsp.type.class.builtin.python"] = { fg = "#cba6f7" }, -- mauve
				["@lsp.type.variable.typeHint.python"] = { fg = "#f9e2af" }, -- yellow
				["@lsp.type.function.decorator.python"] = { fg = "#fab387" }, -- peach
				["@lsp.type.selfParameter.python"] = { fg = "#f38ba8" }, -- red
				["@lsp.type.parameter.python"] = { fg = colors.maroon, italic = true },

				-- ============================================================
				-- JAVASCRIPT/TYPESCRIPT
				-- ============================================================

				-- Readonly modifiers
				["@lsp.type.variable.readonly.javascript"] = { fg = "#cdd6f4" }, -- text
				["@lsp.type.variable.readonly.typescript"] = { fg = "#cdd6f4" }, -- text
				["@lsp.type.property.readonly.javascript"] = { fg = "#cdd6f4" }, -- text
				["@lsp.type.property.readonly.typescript"] = { fg = "#cdd6f4" }, -- text
				["@lsp.type.variable.readonly.javascriptreact"] = { fg = "#cdd6f4" }, -- text
				["@lsp.type.variable.readonly.typescriptreact"] = { fg = "#cdd6f4" }, -- text
				["@lsp.type.property.readonly.javascriptreact"] = { fg = "#cdd6f4" }, -- text
				["@lsp.type.property.readonly.typescriptreact"] = { fg = "#cdd6f4" }, -- text

				-- TypeScript specific
				["@lsp.type.interface.typescript"] = { fg = colors.yellow, italic = true },
				["@lsp.type.type.typescript"] = { fg = colors.yellow, italic = true },

				-- ============================================================
				-- RUST-SPECIFIC
				-- ============================================================

				["@lsp.type.builtinAttribute.attribute.library.rust"] = { fg = "#89b4fa" }, -- blue
				["@lsp.type.generic.attribute.rust"] = { fg = "#cdd6f4" }, -- text
				["@lsp.type.lifetime.rust"] = { fg = colors.blue, italic = true },
				["@lsp.type.selfKeyword.rust"] = { fg = "#f38ba8" }, -- red
				["@lsp.type.macro.rust"] = { fg = colors.blue, italic = true },

				-- ============================================================
				-- GO-SPECIFIC
				-- ============================================================

				["@lsp.type.type.defaultLibrary.go"] = { fg = "#cba6f7" }, -- mauve
				["@lsp.type.variable.readonly.defaultLibrary.go"] = { fg = "#cba6f7" }, -- mauve

				-- ============================================================
				-- SCALA-SPECIFIC
				-- ============================================================

				["@lsp.type.variable.readonly.scala"] = { fg = "#cdd6f4" }, -- text

				-- ============================================================
				-- TOML-SPECIFIC
				-- ============================================================

				["@lsp.type.tomlArrayKey"] = { fg = "#89b4fa" }, -- blue
				["@lsp.type.tomlTableKey"] = { fg = "#89b4fa" }, -- blue

				-- ============================================================
				-- NIX-SPECIFIC
				-- ============================================================

				["@lsp.type.constant.builtin.readonly.nix"] = { fg = "#cba6f7" }, -- mauve

				-- ============================================================
				-- C/C++-SPECIFIC
				-- ============================================================

				["@lsp.type.macro.cpp"] = { fg = colors.mauve },
				["@lsp.type.namespace.cpp"] = { fg = colors.yellow },

				-- ============================================================
				-- JAVA-SPECIFIC
				-- ============================================================

				["@lsp.type.annotation.java"] = { fg = colors.peach },
				["@lsp.type.modifier.java"] = { fg = colors.mauve },

				-- ============================================================
				-- C#-SPECIFIC
				-- ============================================================

				["@lsp.type.property.cs"] = { fg = colors.text },
				["@lsp.type.namespace.cs"] = { fg = colors.yellow },

				-- ============================================================
				-- LUA-SPECIFIC
				-- ============================================================

				["@lsp.type.property.lua"] = { fg = colors.text },
				["@lsp.type.variable.global.lua"] = { fg = colors.maroon },

				-- ============================================================
				-- MARKDOWN/DOCUMENTATION
				-- ============================================================

				["@lsp.type.heading"] = { fg = "#f38ba8" }, -- red
				["@lsp.type.text.emph"] = { fg = "#f38ba8", italic = true }, -- red italic
				["@lsp.type.text.strong"] = { fg = "#f38ba8", bold = true }, -- red bold
				["@lsp.type.text.math"] = { fg = "#f2cdcd" }, -- flamingo

				-- ============================================================
				-- MODIFIERS (work across all languages)
				-- ============================================================

				["@lsp.mod.readonly"] = { fg = colors.lavender },
				["@lsp.mod.deprecated"] = { fg = colors.overlay0, strikethrough = true },
				["@lsp.mod.static"] = { italic = true },
				["@lsp.mod.abstract"] = { italic = true },
				["@lsp.mod.async"] = { italic = true },
				["@lsp.mod.declaration"] = {},
				["@lsp.mod.definition"] = {},
				["@lsp.mod.documentation"] = { italic = true },
				["@lsp.mod.defaultLibrary"] = { fg = colors.maroon },
				["@lsp.mod.label"] = { fg = colors.peach },

				-- ============================================================
				-- COMBINED TYPE + MODIFIER TOKENS
				-- ============================================================

				-- Readonly variables (general)
				["@lsp.typemod.variable.readonly"] = { fg = colors.lavender },
				["@lsp.typemod.property.readonly"] = { fg = colors.lavender },

				-- Static members
				["@lsp.typemod.function.static"] = { fg = colors.blue, italic = true },
				["@lsp.typemod.method.static"] = { fg = colors.blue, italic = true },
				["@lsp.typemod.variable.static"] = { fg = colors.maroon },

				-- Default library functions/types
				["@lsp.typemod.function.defaultLibrary"] = { fg = colors.red },
				["@lsp.typemod.method.defaultLibrary"] = { fg = colors.red },
				["@lsp.typemod.type.defaultLibrary"] = { fg = colors.mauve },

				-- Deprecated items
				["@lsp.typemod.function.deprecated"] = { fg = colors.overlay0, strikethrough = true },
				["@lsp.typemod.method.deprecated"] = { fg = colors.overlay0, strikethrough = true },
				["@lsp.typemod.variable.deprecated"] = { fg = colors.overlay0, strikethrough = true },

				-- ============================================================
				-- OTHER/MISC
				-- ============================================================

				["@lsp.type.pol"] = { fg = "#f2cdcd" }, -- flamingo
				["@lsp.type.operator"] = { fg = colors.sky },
				["@lsp.type.regexp"] = { fg = colors.pink },
				["@lsp.type.escapeSequence"] = { fg = colors.pink },

				-- Labels (like in switch/case or goto)
				["@lsp.type.label"] = { fg = colors.peach },
			}
		end,
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
