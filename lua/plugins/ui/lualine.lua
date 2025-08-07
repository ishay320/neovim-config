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
				"filetype",
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
