require('core')
require('gitsigns').setup()

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
