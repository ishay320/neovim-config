-- Enhanced gf/gF support in terminals
local function parse_line_under_cursor()
	local word = vim.fn.expand("<cWORD>") -- get word under cursor
	-- Try C style first (filename:lineno) using the word
	local filepath, lineno = string.match(word, "^(.+):(%d+)")
	if filepath and lineno then
		return { filepath, lineno }
	end

	-- If not found, try Python style on the entire line
	local line = vim.fn.getline(".")

	-- Python error format: File "/path/to/file.py", line 107, in function_name
	filepath, lineno = string.match(line, 'File%s+"([^"]+)"%s*,%s*line%s+(%d+)')
	if filepath and lineno then
		return { filepath, lineno }
	end

	word = vim.fn.expand("<cfile>")
	if word ~= "" then
		return word
	end
	return nil
end

local function go_to_file_terminal(jump_to_line)
	local result = parse_line_under_cursor()
	if not result then
		vim.notify("No file found under cursor", vim.log.levels.WARN)
		return
	end

	local filepath, lineno
	if type(result) == "table" then
		filepath, lineno = result[1], result[2]
	else
		filepath = result
	end

	vim.cmd("wincmd p") -- jump to last window

	vim.cmd("edit " .. filepath)
	if jump_to_line and lineno then
		vim.cmd(tostring(lineno))
	end
end
-- TODO: jump to last/next command

return {
	"akinsho/toggleterm.nvim",

	version = "*",
	opts = {
		open_mapping = { [[<C-\>]], [[<C-_>]], [[<C-/>]] },
		on_open = function()
			vim.keymap.set("n", "gf", function()
				go_to_file_terminal(false)
			end, { buffer = true })
			vim.keymap.set("n", "gF", function()
				go_to_file_terminal(true)
			end, { buffer = true })
		end,
		auto_scroll = false,
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)
		local map = vim.keymap.set

		-- Resize terminal
		map("t", "<C-Up>", "<cmd>resize +1<cr>", { desc = "Increase Terminal Height" })
		map("t", "<C-Down>", "<cmd>resize -1<cr>", { desc = "Decrease Terminal Height" })

		-- Terminal window navigation
		map("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Move Left" })
		map("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Move Down" })
		map("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Move Up" })
		map("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Move Right" })

		-- Select terminal
		map({ "t", "n" }, "<leader><C-_>", "<cmd>TermSelect<cr>", { desc = "Select terminal" })
		map({ "t", "n" }, "<leader><C-/>", "<cmd>TermSelect<cr>", { desc = "Select terminal (Ghostty)" })
	end,
}
