local uv = vim.loop

-- Get LSP root directory or fallback to CWD
local function find_project_root()
	local clients = vim.lsp.get_active_clients({ bufnr = 0 })
	for _, client in ipairs(clients) do
		if client.config.root_dir then
			return client.config.root_dir
		end
	end
	return vim.fn.getcwd()
end

-- Recursively scan for a folder with python binary
local function find_python_interpreter(root)
	local function is_python(path)
		return vim.fn.executable(path .. "/bin/python") == 1 or vim.fn.executable(path .. "/Scripts/python.exe") == 1
	end

	local function scan_dir(dir)
		local handle = uv.fs_scandir(dir)
		if not handle then
			return nil
		end
		while true do
			local name, t = uv.fs_scandir_next(handle)
			if not name then
				break
			end
			local full = dir .. "/" .. name
			if t == "directory" then
				if is_python(full) then
					return vim.fn.executable(full .. "/bin/python") == 1 and full .. "/bin/python"
						or full .. "/Scripts/python.exe"
				else
					local res = scan_dir(full)
					if res then
						return res
					end
				end
			end
		end
		return nil
	end

	return scan_dir(root)
end

-- Update pyright in real-time
local function update_pyright_python_path(python_path)
	for _, client in pairs(vim.lsp.get_active_clients()) do
		if client.name == "pyright" then
			client.config.settings = client.config.settings or {}
			client.config.settings.python = client.config.settings.python or {}
			client.config.settings.python.pythonPath = python_path
			client.notify("workspace/didChangeConfiguration", {
				settings = client.config.settings,
			})
			print("🔁 Pyright pythonPath updated to: " .. python_path)
			break
		end
	end
end

-- Define :Venv command
vim.api.nvim_create_user_command("Venv", function()
	local root = find_project_root()
	local py = find_python_interpreter(root)
	if not py then
		print("⚠️ No virtual environment with python found in: " .. root)
		return
	end

	local ve = vim.fn.fnamemodify(py, ":h:h")
	vim.env.VIRTUAL_ENV = ve
	vim.env.PATH = ve .. (vim.loop.os_uname().sysname == "Windows" and "\\Scripts;" or "/bin:") .. ":" .. vim.env.PATH
	vim.g.python3_host_prog = py

	print("✅ Venv activated: " .. ve)
	update_pyright_python_path(py)
end, { desc = "Detect and activate Python venv and update Pyright" })
