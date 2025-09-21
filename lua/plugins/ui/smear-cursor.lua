local enabled = false
if vim.g.neovide then
	enabled = false
end

return {
	"sphamba/smear-cursor.nvim",
	opts = {
		enabled = enabled,
		stiffness = 0.8,
		trailing_stiffness = 0.5,
		stiffness_insert_mode = 0.7,
		trailing_stiffness_insert_mode = 0.7,
		damping = 0.8,
		damping_insert_mode = 0.8,
		distance_stop_animating = 0.5,
	},
}
