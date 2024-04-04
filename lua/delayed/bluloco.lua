require("bluloco").setup({
	style = "auto", -- "auto" | "dark" | "light"
	transparent = false,
	italics = false,
	terminal = vim.fn.has("gui_running") == 1,
	guicursor = true,
})
vim.cmd.colorscheme("bluloco")
