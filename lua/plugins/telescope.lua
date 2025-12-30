return {
	-- Fuzzy Finder (files, lsp, etc)
	"nvim-telescope/telescope.nvim",
	tag = "v0.2.0",

	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required

		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font }, -- Useful for getting pretty icons, but requires a Nerd Font.
	},

	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-f>"] = "to_fuzzy_refine",
					["<C-Down>"] = require("telescope.actions").cycle_history_next,
					["<C-Up>"] = require("telescope.actions").cycle_history_prev,
				},
			},
		},
		-- pickers = {}
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown(),
			},
		},
	},

	config = function(_, opts)
		require("telescope").setup(opts)

		-- Enable Telescope extensions
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")

		local builtin = require("telescope.builtin")
		local map = vim.keymap.set
		map("n", "<leader>fh", builtin.help_tags, { desc = "[F]inde [H]elp" })
		map("n", "<leader>fm", builtin.man_pages, { desc = "[F]inde [M]an pages" })
		map("n", "<leader>fk", builtin.keymaps, { desc = "[F]inde [K]eymaps" })
		map("n", "<leader>ff", builtin.find_files, { desc = "[F]inde [F]iles" })
		map("n", "<leader>fb", builtin.builtin, { desc = "[F]inde [B]uiltin" })
		map("n", "<leader>fw", builtin.grep_string, { desc = "[F]inde current [W]ord" })
		map("n", "<leader>fg", function()
			require("config.multigrep").live_multigrep({})
		end, { desc = "[F]inde [G]rep" })
		map("n", "<leader>fd", builtin.diagnostics, { desc = "[F]inde [D]iagnostics" })
		map("n", "<leader>fr", builtin.resume, { desc = "[F]inde [R]esume" })
		map("n", "<leader>fl", builtin.git_commits, { desc = "[F]inde [L]og" })
		map("n", "<leader>f.", builtin.oldfiles, { desc = '[F]inde Recent Files ("." for repeat)' })
		map("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
		map("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })
		map("n", "<leader>f/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[F]ind [/] in Open Files" })
		map("n", "<leader>fn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[F]ind [N]eovim files" })
	end,
}
