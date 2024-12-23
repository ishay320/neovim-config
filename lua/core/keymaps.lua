-- [[ Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- Jump to terminal if exist or jump back if in terminal
-- vim.keymap.set("n", "<leader>t", function()
-- 	local terminalBuffers = {}
-- 	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
-- 		if vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
-- 			table.insert(terminalBuffers, buf)
-- 		end
-- 	end
-- 	-- Get the current buffer
-- 	local currentBuffer = vim.fn.bufnr()
--
-- 	-- If the current buffer is a terminal buffer, switch to the previous buffer
-- 	if vim.tbl_contains(terminalBuffers, currentBuffer) then
-- 		vim.cmd.buffer("#")
-- 	else
-- 		-- If there are terminal buffers, switch to the first one
-- 		if #terminalBuffers > 0 then
-- 			vim.cmd.buffer(terminalBuffers[1])
-- 		else
-- 			vim.cmd.terminal()
-- 			print("No terminal buffers found, creating new one")
-- 		end
-- 	end
-- end, { desc = "Toggle terminal" })
-- TODO: if more then one terminal, show list to choose from

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- netrw explorer shortcut
vim.keymap.set("n", "-", vim.cmd.Ex)

-- move lines up and down
vim.keymap.set("n", "<A-k>", ":m .-2<CR>", { desc = "Move line up" })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>", { desc = "Move line down" })

-- autoformat
vim.keymap.set("n", "<leader>af", function()
	vim.g.autoformat = not vim.g.autoformat
	print("autoformat is now " .. tostring(vim.g.autoformat))
end, { desc = "Toggle autoformat" })

-- go to next git change
vim.keymap.set("n", "[h", ":Gitsigns prev_hunk<CR>", { desc = "Go to previews git hunk" })
vim.keymap.set("n", "]h", ":Gitsigns next_hunk<CR>", { desc = "Go to next git hunk" })
