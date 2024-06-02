local function setup()
	local lsp = require("lsp-zero").preset()

	lsp.on_attach(function(_, bufnr)
		lsp.default_keymaps({ buffer = bufnr })
	end)

	require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

	lsp.setup()

	require("mason").setup()
	require("mason-null-ls").setup({
		ensure_installed = {
			"buildifier",
			"stylua",
			"black",
			"mypy",
			"rust_analyzer",
			"clangd",
			"lua_ls",
			"pyright",
			"lua-language-server",
		},
		automatic_installation = true,
		handlers = {},
	})

	require("null-ls").setup()

	local cmp = require("cmp")

	cmp.setup({
		sources = {
			{ name = "path" },
			{ name = "buffer", keyword_length = 3 },
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
		},
		mapping = {
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		},
	})
end

return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	config = setup,
	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "L3MON4D3/LuaSnip" },
		{
			"nvimtools/none-ls.nvim",
			dependencies = {
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd.MasonUpdate)
				end,
			},
		},
		{ "jay-babu/mason-null-ls.nvim" },
	},
}
