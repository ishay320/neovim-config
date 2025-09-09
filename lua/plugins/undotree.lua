return {
	-- show undo history that you can jump between undos
	"mbbill/undotree",

	config = function()
		vim.g.undotree_ShortIndicators = true
		vim.g.undotree_TreeNodeShape = "•"
		vim.g.undotree_TreeReturnShape = "╲"
		vim.g.undotree_TreeVertShape = "│"
		vim.g.undotree_TreeSplitShape = "╱"
	end,
	keys = {
		{
			"<leader>u",
			vim.cmd.UndotreeToggle,
			desc = "Toggle Undotree",
		},
	},
}
