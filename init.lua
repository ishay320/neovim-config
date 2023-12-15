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

require('nvim-treesitter.configs').setup {
  rainbow = {
    enable = true,
    -- Which query to use for finding delimiters
    query = 'rainbow-parens',
    -- Highlight the entire buffer all at once
    strategy = require('ts-rainbow').strategy.global,
  }
}
