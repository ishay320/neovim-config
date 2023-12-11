require("config.keymaps")
require("config.lazy")
require("config.colors")


vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true



require("toggleterm").setup {
	open_mapping = [[<c-\>]],
}

require('lualine').setup({
})
