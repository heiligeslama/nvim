return {
	"lewis6991/gitsigns.nvim",
	branch = "release",
	config = function()
		require("gitsigns").setup({
			numhl = true,
		})
	end,
}
