require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"cpp",
		"rust",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"python",
		"diff",
		"git_rebase",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
		-- disable = { "gitcommit", "diff" },
	},
})
