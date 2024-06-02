return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
		"VonHeikemen/lsp-zero.nvim",
	},
	config = function()
		require("mason-nvim-dap").setup({
			ensure_installed = { "python", "codelldb" },
		})
	end,
}
