-- [[ Keymaps ]]
local map = vim.keymap.set
-- Groups are in the which-key plugin

-- Clear search highlight on <Esc>
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Better j/k for wrapped lines
map({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, noremap = true })
map({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, noremap = true })

-- Buffer navigation
map("n", "[b", "<cmd>bprev<CR>", { desc = "Go to previous [B]uffer" })
map("n", "]b", "<cmd>bnext<CR>", { desc = "Go to next [B]uffer" })

-- Diagnostic navigation
map("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to previous [D]iagnostic message" })
map("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next [D]iagnostic message" })

-- Diagnostic actions
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Windows navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move focus to the upper window" })

-- Window resizing
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- move lines up and down
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Quick substitute
map(
	"n",
	"<leader>s",
	":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
	{ desc = "[S]ubstitute word under cursor" }
)
map("v", "<leader>s", ":s/", { desc = "[S]ubstitute in selection" })

-- File explorer
map("n", "-", vim.cmd.Ex, { desc = "Open file explorer" })

-- Exit terminal mode in the builtin terminal
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Toggle autoformat
map("n", "<leader>tf", function()
	vim.g.autoformat = not vim.g.autoformat
	print("Autoformat is now " .. tostring(vim.g.autoformat))
end, { desc = "[T]oggle auto[F]ormat" })
map("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "[T]oggle [W]rap" })

-- Disable arrow keys in normal mode
map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
