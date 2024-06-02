local init_call = "./install --all"
if vim.fn.has("win32") == 1 then
	init_call = "pwsh install.ps1"
end

return {
	"junegunn/fzf",
	build = init_call,
}
