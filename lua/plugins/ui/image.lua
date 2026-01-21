return {
	-- Plugin for showing images
	"3rd/image.nvim",
	event = "VeryLazy",
	-- Only enable if ImageMagick is installed
	cond = function()
		-- Check if magick command exists
		local magick_installed = vim.fn.executable("magick") == 1 or vim.fn.executable("convert") == 1

		if not magick_installed then
			vim.notify(
				"ImageMagick not found. Please install it to use image.nvim\n"
					.. "Ubuntu/Debian: sudo apt-get install libmagickwand-dev\n"
					.. "Arch: sudo pacman -S imagemagick\n",
				vim.log.levels.WARN
			)
			return false
		end

		return true
	end,
	opts = {},
}
