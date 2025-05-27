-- TODO:
-- - add more terminal at a click
-- - swap between them example: 3<c-/>
-- - show the terminals at a click
return {
	"akinsho/toggleterm.nvim",

	version = "*",
	config = function()
		require("toggleterm").setup({})

		-- Keymaps for opening/closing terminal
		vim.keymap.set("n", "<C-_>", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal (Normal)" })
		vim.keymap.set("t", "<C-_>", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal (Terminal)" })

		vim.keymap.set("n", "<C-/>", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal (Normal, Ghostty)" })
		vim.keymap.set("t", "<C-/>", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal (Terminal, Ghostty)" })

		-- Resize terminal
		vim.keymap.set("t", "<C-Up>", "<cmd>resize +1<cr>", { desc = "Increase Terminal Height" })
		vim.keymap.set("t", "<C-Down>", "<cmd>resize -1<cr>", { desc = "Decrease Terminal Height" })

		-- Terminal window navigation
		vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Move Left" })
		vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Move Down" })
		vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Move Up" })
		vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Move Right" })

		-- Enhanced gf/gF support in terminals
		local function parse_line_under_cursor()
			local word = vim.fn.expand("<cWORD>") -- get word under cursor
			local filepath, lineno = string.match(word, "^(.+):(%d+)")
			if filepath then
				return { filepath, lineno }
			end
			local word = vim.fn.expand("<cfile>")
			if word ~= "" then
				return word
			end
			return nil
		end

		local function go_to_file_terminal(jump_to_line)
			-- local pos = vim.api.nvim_win_get_cursor(0)
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

			require("toggleterm").toggle(0)
			vim.cmd("edit " .. filepath)
			if jump_to_line and lineno then
				vim.cmd(tostring(lineno))
			end
		end

		vim.api.nvim_create_autocmd("TermOpen", {
			pattern = "term://*toggleterm#*",
			callback = function()
				vim.keymap.set("n", "gf", function()
					go_to_file_terminal(false)
				end, { buffer = true })
				vim.keymap.set("n", "gF", function()
					go_to_file_terminal(true)
				end, { buffer = true })
			end,
			group = vim.api.nvim_create_augroup("ToggleTermGF", {}),
		})
	end,
}
