return {
	"rcarriga/nvim-notify",
	priority = 100,
	opts = {},
	config = function()
		vim.notify = vim.schedule_wrap(require("notify").notify)
	end,
}
