vim.g.mapleader = " "                -- leader

vim.keymap.set("n", "-", vim.cmd.Ex) -- set explorer to '-'

-- LSP keys --
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float) -- open float
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- vim.keymap.set('n', '<space>f', vim.lsp.buf.format)
