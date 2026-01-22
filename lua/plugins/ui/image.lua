return {
	-- Plugin for showing images
	"3rd/image.nvim",
	event = "VeryLazy",
	-- Only enable if ImageMagick is installed
	cond = function()
		-- Check if magick command exists
		local magick_installed = vim.fn.executable("magick") == 1 or vim.fn.executable("convert") == 1

		-- Notify only once if not installed
		if not magick_installed and not vim.g.image_nvim_warning_shown then
			vim.g.image_nvim_warning_shown = true
			vim.schedule(function()
				vim.notify(
					"ImageMagick not found. Please install it to use image.nvim\n"
						.. "Ubuntu/Debian: sudo apt-get install libmagickwand-dev\n"
						.. "Arch: sudo pacman -S imagemagick",
					vim.log.levels.WARN
				)
			end)
		end

		return magick_installed
	end,
	opts = {},
}
