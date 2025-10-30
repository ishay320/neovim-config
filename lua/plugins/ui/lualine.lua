-- Function to toggle Copilot
local function toggle_copilot()
	vim.cmd("Copilot toggle")
end

-- Function to toggle line endings between Unix and DOS
local function toggle_fileformat()
	if vim.bo.fileformat == "unix" then
		vim.bo.fileformat = "dos"
		vim.notify("Switched to Windows line endings (CRLF)")
	else
		vim.bo.fileformat = "unix"
		vim.notify("Switched to Unix line endings (LF)")
	end
end

-- Function to choose file type
local function choose_filetype()
	local filetypes = vim.fn.getcompletion("", "filetype")
	table.sort(filetypes)

	vim.ui.select(filetypes, {
		prompt = "Select file type:",
		format_item = function(item)
			return item
		end,
	}, function(choice)
		if not choice then
			return -- User cancelled
		end

		vim.bo.filetype = choice
		vim.notify("Filetype set to: " .. choice)
	end)
end

local function autoformat_icon()
	if vim.g.autoformat then
		return " 󱩤 "
	else
		return " 󱩪 "
	end
end

local function autoformat_select()
	local options = {
		"󱩤 On",
		"󱩪 Off",
	}
	vim.ui.select(options, {
		prompt = "Select autoformat mode:",
	}, function(choice)
		if choice == options[1] then
			vim.g.autoformat = true
		elseif choice == options[2] then
			vim.g.autoformat = false
			-- elseif choice == options[3] then
			-- 	vim.g.autoformat = "gitdiff"
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
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
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
			lualine_c = {
				{
					"filename",
					symbols = { modified = "●", readonly = "󰌾", unnamed = "[No Name]", newfile = "[New]" },
				},
			},
			lualine_x = {
				{ autoformat_icon, on_click = autoformat_select },
				{ "copilot", on_click = toggle_copilot },
				{
					"fileformat",
					on_click = toggle_fileformat,
					icons_enabled = true,
					padding = { left = 1, right = 2 },
				},
				{ "filetype", on_click = choose_filetype, separator = "" },
				{
					"lsp_status",
					on_click = function()
						vim.cmd("LspInfo")
					end,
					color = "lualine_c_inactive",
					padding = { left = 0, right = 1 },
				},
			},
			lualine_y = {
				{ "progress", separator = "", padding = { left = 1, right = 1 } },
				{ "location", padding = { left = 0, right = 1 } },
			},
			lualine_z = {
				function()
					return " " .. os.date("%R")
				end,
			},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {
				{
					"filename",
					symbols = { modified = "●", readonly = "󰌾", unnamed = "[No Name]", newfile = "[New]" },
				},
			},
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {},
	},
}
