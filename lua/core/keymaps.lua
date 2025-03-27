-- [[ Keymaps ]]
--  See `:help vim.keymap.set()`

-- Groups are in the ../plugins/ui.lua file

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- buffers
vim.keymap.set("n", "[b", "<cmd>bprev<CR>", { desc = "Go to previous [B]uffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<CR>", { desc = "Go to next [B]uffer" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

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
vim.keymap.set("n", "<leader>tf", function()
	vim.g.autoformat = not vim.g.autoformat
	print("autoformat is now " .. tostring(vim.g.autoformat))
end, { desc = "[T]oggle auto[F]ormat" })

-- go to next git change
vim.keymap.set("n", "[h", ":Gitsigns prev_hunk<CR>", { desc = "Go to previews git hunk" })
vim.keymap.set("n", "]h", ":Gitsigns next_hunk<CR>", { desc = "Go to next git hunk" })

vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "[G]it [P]review" })
vim.keymap.set("n", "<leader>gi", "<cmd>Gitsigns preview_hunk_inline<cr>", { desc = "[G]it [I]nline preview" })
vim.keymap.set("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "[G]it [R]eset hunk" })
vim.keymap.set("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", { desc = "[G]it [S]tage hunk" })

-- aerial
-- there are also { and } for moving inside the aerial plugin from one symbol to the next
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
