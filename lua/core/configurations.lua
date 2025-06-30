-- [Basic configuration]
-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set Nerd Font as installed
vim.g.have_nerd_font = true

-- Autoformat on close
vim.g.autoformat = true

-- [[ Setting options ]]
-- See `:help vim.opt`

-- Add all project folders and C++ includes to search path
vim.opt.path:append({ "**", "/usr/include/c++/**" })

-- Add squiggly line under wrongly spelled word
-- `z=` for fix list
vim.opt.spell = true

-- Enable line numbers (relative + absolute hybrid)
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Hide mode (since it's in the status line)
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim
-- vim.opt.clipboard = "unnamedplus"

-- Enable break indent for better readability
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Smarter case-sensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain white space characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Live preview for substitutions
vim.opt.inccommand = "split"

-- Highlight current cursor line
vim.opt.cursorline = true

-- Keep at least 10 lines above/below the cursor when scrolling
vim.opt.scrolloff = 10

-- Indentation settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Help Functions
function _G.put_text(...)
	local objects = {}
	for i = 1, select("#", ...) do
		local v = select(i, ...)
		table.insert(objects, vim.inspect(v))
	end

	local lines = vim.split(table.concat(objects, "\n"), "\n")
	local lnum = vim.api.nvim_win_get_cursor(0)[1]
	vim.fn.append(lnum, lines)
	return ...
end

-- Improve netrw file explorer behavior
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0

-- Terminal
if vim.fn.has("win32") == 1 then
	vim.o.shell = "powershell"
	vim.o.shellcmdflag =
		"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
	vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
	vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
	vim.o.shellquote = ""
	vim.o.shellxquote = ""
end
