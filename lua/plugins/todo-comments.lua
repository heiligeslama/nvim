return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("todo-comments").setup({
			highlight = {
				pattern = [[.*<(KEYWORDS)\s*%(\(.*\))?:]],
				keyword = "bg",
			},
			search = {
				pattern = [[\b(KEYWORDS)\s*(\(.*\))?:]],
			},
		})
	end,
}
