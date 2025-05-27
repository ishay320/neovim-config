return {
	-- show undo history that you can jump between undos
	"mbbill/undotree",

	opts = {},
	keys = {
		{
			"<leader>u",
			function()
				vim.cmd.UndotreeToggle()
			end,
			desc = "Toggle Undotree",
		},
	},
}
