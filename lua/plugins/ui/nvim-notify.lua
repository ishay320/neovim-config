return {
	"rcarriga/nvim-notify",
	opts = {},
	config = function()
		vim.notify = vim.schedule_wrap(require("notify"))
	end,
}
