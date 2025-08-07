if vim.g.neovide then
	vim.o.guifont = "FiraMono Nerd Font Mono:h12"
	vim.api.nvim_set_keymap("v", "<sc-c>", '"+y', { noremap = true })
	vim.api.nvim_set_keymap("v", "<sc-v>", '"+p', { noremap = true })
	vim.api.nvim_set_keymap("n", "<sc-v>", '"+p', { noremap = true }) -- normal
	vim.api.nvim_set_keymap("c", "<sc-v>", "<C-R>0", { noremap = true }) -- command
	vim.api.nvim_set_keymap("i", "<sc-v>", '<ESC>"+pi', { noremap = true }) -- insert
	vim.api.nvim_set_keymap("t", "<sc-v>", '<C-\\><C-n>"+pi', { noremap = true }) -- terminal

	vim.g.neovide_scale_factor = 1.0
	local change_scale_factor = function(delta)
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
	end
	vim.keymap.set("n", "<C-=>", function()
		change_scale_factor(1.1)
	end)
	vim.keymap.set("n", "<C-->", function()
		change_scale_factor(1 / 1.1)
	end)
end
