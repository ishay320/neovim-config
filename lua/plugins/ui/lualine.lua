-- Function to toggle Copilot
local function toggle_copilot()
	vim.cmd("Copilot toggle")
end

-- Function to toggle line endings between Unix and DOS
local function toggle_fileformat()
	if vim.bo.fileformat == "unix" then
		vim.bo.fileformat = "dos"
		print("Switched to Windows line endings (CRLF)")
	else
		vim.bo.fileformat = "unix"
		print("Switched to Unix line endings (LF)")
	end
end

-- Function to choose file type
local function choose_filetype()
	-- Common file types - you can customize this list
	local filetypes = {
		"lua",
		"python",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"html",
		"css",
		"scss",
		"json",
		"yaml",
		"markdown",
		"vim",
		"bash",
		"sh",
		"c",
		"cpp",
		"java",
		"go",
		"rust",
		"ruby",
		"php",
		"sql",
		"dockerfile",
		"makefile",
		"xml",
		"toml",
		"ini",
		"conf",
		"text",
		"gitcommit",
		"gitrebase",
		"diff",
	}

	-- Sort the list alphabetically
	table.sort(filetypes)

	-- Add current filetype at the top if it's set and not empty
	local current_ft = vim.bo.filetype
	if current_ft and current_ft ~= "" then
		table.insert(filetypes, 1, "→ Current: " .. current_ft)
		table.insert(filetypes, 2, "───────────────")
	end

	-- Add manual input option at the end
	table.insert(filetypes, "───────────────")
	table.insert(filetypes, "✎ Enter custom filetype...")

	-- Create the selection menu
	vim.ui.select(filetypes, {
		prompt = "Select file type:",
		format_item = function(item)
			return item
		end,
	}, function(choice)
		if not choice then
			return -- User cancelled
		end

		-- Handle special cases
		if choice:match("^→ Current:") or choice:match("^─+$") then
			return -- Skip these entries
		elseif choice == "✎ Enter custom filetype..." then
			-- Ask for custom input
			vim.ui.input({
				prompt = "Enter custom filetype: ",
				default = vim.bo.filetype,
			}, function(input)
				if input and input ~= "" then
					vim.bo.filetype = input
					print("Filetype set to: " .. input)
				end
			end)
		else
			-- Set the selected filetype
			vim.bo.filetype = choice
			print("Filetype set to: " .. choice)
		end
	end)
end

return {
	-- show line of informative information
	"nvim-lualine/lualine.nvim",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"AndreM222/copilot-lualine",
	},
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {},
			always_divide_middle = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				"branch",
				"diff",
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = { error = " ", warn = " ", info = " ", hint = " " },
				},
			},
			lualine_c = { "filename" },
			lualine_x = {
				{ "copilot", on_click = toggle_copilot },
				"encoding",
				{
					"fileformat",
					on_click = toggle_fileformat,
					icons_enabled = true,
				},
				{ "filetype", on_click = choose_filetype },
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {},
	},
}
