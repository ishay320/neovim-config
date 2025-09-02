-- [Basic configuration]
-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true -- Set Nerd Font as installed
vim.g.autoformat = true -- Autoformat on close

-- [[ Setting options ]]
-- Line numbers and display
vim.opt.number = true -- Enable line numbers (relative + absolute hybrid)
vim.opt.relativenumber = true -- set the line numbers to be relative to the current line
vim.opt.cursorline = true -- Highlight current cursor line
vim.opt.scrolloff = 10 -- Keep at least 10 lines above/below the cursor when scrolling
vim.opt.signcolumn = "yes" -- Keep signcolumn on by default
vim.opt.showmode = false -- Hide mode (since it's in the status line)
vim.o.winborder = "rounded" -- set the borders of the info
vim.opt.spell = true -- Add squiggly line under wrongly spelled word

-- White space and formatting display
vim.opt.list = true -- Sets how neovim will display certain white space characters in the editor.
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.breakindent = true -- Enable break indent for better readability

-- Search behavior
vim.opt.ignorecase = true -- Smarter case-sensitive searching
vim.opt.smartcase = true
vim.opt.inccommand = "split" -- Live preview for substitutions
vim.opt.hlsearch = true

-- Splits behavior
vim.opt.splitright = true -- Configure how new splits should be opened
vim.opt.splitbelow = true

-- System integration
vim.opt.mouse = "a" -- Enable mouse mode, can be useful for resizing splits for example!
-- vim.opt.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim
vim.opt.path:append({ "**", "/usr/include/c++/**" }) -- Add all project folders and C++ includes to search path

-- Indentation settings
vim.opt.updatetime = 250 -- Decrease update time
vim.opt.timeoutlen = 300 -- Decrease mapped sequence wait time - Displays which-key popup sooner

-- Indentation settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- File handling
vim.opt.autoread = true
vim.opt.autowrite = false
vim.opt.undofile = true
local undodir = vim.fn.expand("~/.nvim_undodir")
vim.opt.undodir = undodir
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

-- Misc
vim.opt.termguicolors = true -- Enable 24-bit RGB colors

-- Command-line completion
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "node_modules/*", ".git/*" })

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
