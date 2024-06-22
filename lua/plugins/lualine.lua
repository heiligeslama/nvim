return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
			},
			sections = {
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 1,
					},
				},
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
