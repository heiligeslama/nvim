return {
	"rose-pine/neovim",
	lazy = false,
	priority = 1000,
	init = function()
		vim.cmd.colorscheme("rose-pine")
	end,
}
