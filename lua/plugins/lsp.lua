return {
    {
        "saghen/blink.cmp",
        dependencies = "rafamadriz/friendly-snippets",

        version = "*",

        opts = {
            keymap = {
                preset = "enter",
                cmdline = {
                    preset = "super-tab"
                }
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "normal",
            },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            signature = { enabled = true },
            completion = {
                accept = {
                    create_undo_point = true
                },
                ghost_text = {
                    enabled = false
                }
            }
        },
        opts_extend = { "sources.default" },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim"
        },

        opts = {
            servers = {
                lua_ls = {},
                gopls = {},
                rust_analyzer = {},
                clangd = {},
                basedpyright = {},
                zls = {},
            },
        },
        config = function(_, opts)
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "rust_analyzer",
                    "clangd",
                    "lua_ls",
                    "basedpyright",
                    "gopls",
                    "zls",
                },
                automatic_installation = true,
            })
            local lspconfig = require("lspconfig")
            for server, config in pairs(opts.servers) do
                config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
                lspconfig[server].setup(config)
            end
        end,
    },
}
