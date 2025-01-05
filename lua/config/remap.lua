vim.keymap.set("n", "<Leader>l", function()
    vim.cmd.wincmd("l")
end, { silent = true, noremap = true, desc = "Go to left split" })

vim.keymap.set("n", "<Leader>k", function()
    vim.cmd.wincmd("k")
end, { silent = true, noremap = true, desc = "Go to top split" })

vim.keymap.set("n", "<Leader>j", function()
    vim.cmd.wincmd("j")
end, { silent = true, noremap = true, desc = "Go to down split" })

vim.keymap.set("n", "<Leader>h", function()
    vim.cmd.wincmd("h")
end, { silent = true, noremap = true, desc = "Go to left split" })

vim.keymap.set("n", "<Leader>cc", function()
    vim.cmd.bd()
end, { silent = true, noremap = true, desc = "Close current split" })

vim.keymap.set("n", "<Leader>cl", function()
    vim.cmd.wincmd("l")
    vim.cmd.close()
end, { silent = true, noremap = true, desc = "Close left split" })

vim.keymap.set("n", "<Leader>ck", function()
    vim.cmd.wincmd("k")
    vim.cmd.close()
end, { silent = true, noremap = true, desc = "Close top split" })

vim.keymap.set("n", "<Leader>cj", function()
    vim.cmd.wincmd("j")
    vim.cmd.close()
end, { silent = true, noremap = true, desc = "Close lower split" })

vim.keymap.set("n", "<Leader>ch", function()
    vim.cmd.wincmd("h")
    vim.cmd.close()
end, { silent = true, noremap = true, desc = "Close right split" })

vim.keymap.set("n", "<Leader>ff", vim.lsp.buf.format, {
    remap = true,
    silent = true,
    desc = "Format current buffer",
})

vim.keymap.set("n", "<C-Up>", "[e", { remap = true })
vim.keymap.set("n", "<C-Down>", "]e", { remap = true })

vim.keymap.set("v", "<C-Up>", "[egv", { remap = true })
vim.keymap.set("v", "<C-Down>", "]egv", { remap = true })

vim.keymap.set("", "<Up>", "<NOP>", { noremap = true })
vim.keymap.set("", "<Left>", "<NOP>", { noremap = true })
vim.keymap.set("", "<Right>", "<NOP>", { noremap = true })
vim.keymap.set("", "<Down>", "<NOP>", { noremap = true })

vim.keymap.set("n", "<Leader>sh", "<Cmd>set hlsearch!<CR>", {
    silent = true,
    noremap = true,
    desc = "Toggle search highlight",
})

vim.keymap.set("n", "<Leader>rn", "<Cmd> set rnu!<CR>", {
    silent = true,
    noremap = true,
    desc = "Toggle between relative and absolute line numbering",
})

vim.keymap.set("n", "<Leader>dc", function()
    require("dap").continue()
end, { desc = "Enable Debugger" })

vim.keymap.set("n", "<Leader>dn", function()
    require("dap").step_over()
end, { desc = "Debugger Step Over" })

vim.keymap.set("n", "<Leader>di", function()
    require("dap").step_into()
end, { desc = "Debugger Step in" })

vim.keymap.set("n", "<Leader>do", function()
    require("dap").step_out()
end, { desc = "Debugger Step Out" })

vim.keymap.set("n", "<Leader>db", function()
    require("dap").toggle_breakpoint()
end, { desc = "Debugger Toggle Breakpoint" })

vim.keymap.set("n", "<Leader>dB", function()
    require("dap").set_breakpoint()
end, { desc = "Debugger Set Breakpoint" })

vim.keymap.set("n", "gl", function()
    vim.diagnostic.open_float({ bufnr = 0, scope = "line" })
end, {
    remap = true,
    silent = true,
    desc = "Show Diagnostics",
})

vim.keymap.set("n", "ga", vim.lsp.buf.code_action, {
    remap = true,
    silent = true,
    desc = "Run code actions",
})

vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
    remap = true,
    silent = true,
    desc = "Go to declaration",
})

vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
    remap = true,
    silent = true,
    desc = "Go to definition",
})

vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, {
    remap = true,
    silent = true,
    desc = "Rename symbol",
})

vim.keymap.set("n", "gI", vim.lsp.buf.implementation, {
    remap = true,
    silent = true,
    desc = "Go to implementation",
})
