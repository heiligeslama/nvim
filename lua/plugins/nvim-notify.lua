return {
	"rcarriga/nvim-notify",
	lazy = false,
	priority = 2000,
	config = function()
		local notify = require("notify")
		vim.notify = notify
	end,
}
