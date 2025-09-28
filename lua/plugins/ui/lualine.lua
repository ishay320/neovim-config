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

local function autoformat()
	if vim.g.autoformat then
		return " 󱩤 "
	else
		return " 󱩪 "
	end
	-- return " 󱩨 "
end

local function on_click_autoformat()
	local options = {
		"󱩤 On",
		"󱩪 Off",
		-- "󱩨 Git Diff",
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
				{ autoformat, on_click = on_click_autoformat },
				{ "copilot", on_click = toggle_copilot },
				{
					"fileformat",
					on_click = toggle_fileformat,
					icons_enabled = true,
					padding = { left = 1, right = 2 },
				},
				{ "filetype", on_click = choose_filetype, separator = "" },
				{
					function()
						local clients = vim.lsp.get_clients({ bufnr = 0 })
						if #clients == 0 then
							return ""
						end

						return "~ " .. clients[1].name
					end,
					padding = { left = 0, right = 1 },
					on_click = function()
						vim.cmd("LspInfo")
					end,
					color = "lualine_c_inactive",
				},
			},
			lualine_y = {
				{ "progress", separator = "", padding = { left = 1, right = 1 } },
				{ "location", padding = { left = 0, right = 0 } },
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
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {},
	},
}
