require("trouble").setup()
vim.keymap.set("n", "<Leader>t", function()
	vim.cmd.TroubleToggle("document_diagnostics")
end, { silent = true, noremap = true, desc = "Toggle trouble" })
