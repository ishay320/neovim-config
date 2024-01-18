require('core')

require('lualine').setup({})
require('gitsigns').setup()
require('nvim-treesitter.configs').setup {
	rainbow = {
		enable = true,
		-- Which query to use for finding delimiters
		query = 'rainbow-parens',
	}
}
