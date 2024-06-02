return {
	"folke/trouble.nvim",
	config = function()
		local trouble = require("trouble")
		trouble.setup()

		vim.keymap.set("n", "<Leader>t", function()
			trouble.toggle("diagnostics")
		end, { silent = true, noremap = true, desc = "Toggle trouble" })
	end,
}
