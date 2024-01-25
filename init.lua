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

require("toggleterm").setup()

function _G.put_text(...)
	local objects = {}
	for i = 1, select('#', ...) do
		local v = select(i, ...)
		table.insert(objects, vim.inspect(v))
	end

	local lines = vim.split(table.concat(objects, '\n'), '\n')
	local lnum = vim.api.nvim_win_get_cursor(0)[1]
	vim.fn.append(lnum, lines)
	return ...
end
