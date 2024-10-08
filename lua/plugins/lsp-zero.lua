local function setup()
	local lsp = require("lsp-zero")

	local attach = function(_, bufnr)
		lsp.default_keymaps({ buffer = bufnr })
	end

	lsp.extend_lspconfig({
		sign_text = true,
		lsp_attach = attach,
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
	})

	lsp.setup()

	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"rust_analyzer",
			"clangd",
			"lua_ls",
			"basedpyright",
			"gopls",
		},
		automatic_installation = true,
		handlers = {
			function(server_name)
				if server_name == "lua_ls" then
					require("lspconfig")[server_name].setup(lsp.nvim_lua_ls())
				else
					require("lspconfig")[server_name].setup({})
				end
			end,
		},
	})
	require("mason-null-ls").setup({
		ensure_installed = {
			"buildifier",
			"stylua",
			"black",
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
		mapping = cmp.mapping.preset.insert({
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		}),
	})
end

return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v4.x",
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
