local init_call = "./install --all"
if vim.fn.has("win32") == 1 then
	init_call = "pwsh install.ps1"
end

local function setup(plugin)
	return function()
		require(plugin).setup()
	end
end

local function delegate(plugin)
	return function()
		require("delayed." .. plugin)
	end
end

local plugins = {
	{
		"uloco/bluloco.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		config = delegate("bluloco"),
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = setup("ibl"),
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = setup("todo-comments"),
	},
	{ "norcalli/nvim-colorizer.lua", config = setup("colorizer") },
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		config = delegate("lsp-zero"),
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
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		config = delegate("mason-dap"),
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		config = delegate("telescope"),
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = delegate("treesitter"),
		build = function()
			pcall(vim.cmd.TSUpdate)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{ "echasnovski/mini.notify", version = "*", config = setup("mini.notify") },
	{ "tpope/vim-unimpaired" },
	{
		"mbbill/undotree",
		config = delegate("undotree"),
	},
	{
		"junegunn/fzf",
		build = init_call,
	},
	{ "tpope/vim-fugitive" },
	{
		"folke/trouble.nvim",
		config = delegate("trouble"),
	},
	{ "nvim-tree/nvim-web-devicons" },
	{
		"nvim-lualine/lualine.nvim",
		config = delegate("lualine"),
	},
	{
		"stevearc/oil.nvim",
		config = delegate("oil"),
	},
	{
		"lewis6991/gitsigns.nvim",
		branch = "release",
		config = setup("gitsigns"),
	},
	{
		{
			"Cassin01/wf.nvim",
			version = "*",
			config = delegate("wf"),
		},
	},
	{
		"boltlessengineer/bufterm.nvim",
		config = setup("bufterm"),
	},
	{
		"asiryk/auto-hlsearch.nvim",
		tag = "1.1.0",
		config = setup("auto-hlsearch"),
	},
}

local opts = {}

require("lazy").setup({ plugins, opts })
