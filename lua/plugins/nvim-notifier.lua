return {
	"vigoux/notifier.nvim",
	lazy = false,
	priority = 2000,
	config = function()
		require("notifier").setup({})
	end,
}
