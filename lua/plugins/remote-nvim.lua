return {
	"amitds1997/remote-nvim.nvim",

	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		client_callback = function(port, info)
			local cmd

			-- Check if running in tmux
			if vim.env.TMUX then
				cmd = ("tmux new-window -n '%s' 'nvim --server localhost:%s --remote-ui'"):format(info.host, port)
			-- Check if running in Ghostty
			elseif vim.env.TERM == "xterm-ghostty" or vim.env.GHOSTTY_RESOURCES_DIR then
				cmd = ("ghostty -e nvim --server localhost:%s --remote-ui &"):format(port)
			else -- Fallback to regular gnome-terminal
				cmd = ('gnome-terminal -e "nvim --server localhost:%s --remote-ui"'):format(port)
			end

			local result = vim.fn.system(cmd)
			if vim.v.shell_error ~= 0 then
				vim.notify(("Failed to open client: %s"):format(result), vim.log.levels.ERROR)
			end
		end,
	},
}
