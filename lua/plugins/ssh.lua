return {
	{
		"amitds1997/remote-nvim.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("remote-nvim").setup({
				client_callback = function(port, info)
					local cmd = ("tmux new-window -n '%s' 'nvim --server localhost:%s --remote-ui'"):format(
						info.host,
						port
					)
					local result = vim.fn.system(cmd)

					if vim.v.shell_error ~= 0 then
						vim.notify(("Failed to open tmux window: %s"):format(result), vim.log.levels.ERROR)
					end
				end,
			})
		end,
	},
}
