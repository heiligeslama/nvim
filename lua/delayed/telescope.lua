local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope search files" })
vim.keymap.set("n", "<C-g>", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<C-c>", builtin.git_commits, { desc = "Telescope search commits" })
vim.keymap.set("n", "<S-c>", builtin.git_branches, { desc = "Telescope search branches" })
vim.keymap.set("n", "<C-b>", builtin.buffers, { desc = "Telescope search buffers" })
vim.keymap.set("n", "<C-h>", builtin.help_tags, { desc = "Telescope search help tags" })

local maps = {
	n = {
		["q"] = actions.close,
		["<Leader>cc"] = actions.close,
	},
}

require("telescope").setup({
	pickers = {
		find_files = {
			mappings = maps,
		},
		live_grep = {
			mappings = maps,
		},
		git_commits = {
			mappings = maps,
		},
		git_branches = {
			mappings = maps,
		},
		buffers = {
			mappings = maps,
		},
		help_tags = {
			mappings = maps,
		},
	},
})
