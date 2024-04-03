vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
	end,
})

vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("terminal", {}),
	desc = "Disable spelling for terminal buffer",
	pattern = "*",
	command = "setlocal nospell",
})

vim.api.nvim_create_user_command("RR", function(opts)
	vim.cmd.new()
	vim.cmd.only()
	vim.cmd(":put =execute('" .. opts.fargs[1] .. "')")
	vim.bo.buftype = "nofile"
	vim.bo.bufhidden = "hide"
	vim.bo.swapfile = false
end, { nargs = 1 })
