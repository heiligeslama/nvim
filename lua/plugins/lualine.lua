return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
			},
			extensions = {
				"quickfix",
				"fugitive",
				"lazy",
				"trouble",
			},
		})
	end,
}
