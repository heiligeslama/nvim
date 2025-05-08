return {
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "xzbdmw/colorful-menu.nvim"
        },

        version = "*",

        opts = {
            keymap = {
                preset = "enter",
            },

            cmdline = {
                completion = {
                    menu = {
                        auto_show = true
                    }
                },
                keymap = {
                    preset = "super-tab"
                },
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "normal",
            },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            signature = {
                enabled = true,
            },
            completion = {
                menu = {
                    draw = {
                        -- We don't need label_description now because label and label_description are already
                        -- combined together in label by colorful-menu.nvim.
                        columns = { { "kind_icon" }, { "label", gap = 1 } },
                        components = {
                            label = {
                                text = function(ctx)
                                    return require("colorful-menu").blink_components_text(ctx)
                                end,
                                highlight = function(ctx)
                                    return require("colorful-menu").blink_components_highlight(ctx)
                                end,
                            },
                        },
                    },
                },
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
            "williamboman/mason-lspconfig.nvim",
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    }
                }
            }

        },

        opts = {
            servers = {
                lua_ls = {},
                gopls = {},
                rust_analyzer = {},
                clangd = {},
                zls = {},
                jsonls = {},
                ruff = {},
                pylsp = {},
            },
        },
        config = function(_, opts)
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "rust_analyzer",
                    "clangd",
                    "lua_ls",
                    "gopls",
                    "zls",
                    "jsonls",
                    "ruff",
                    "pylsp",
                },
                automatic_installation = true,
            })
            require("lspconfig")
            vim.keymap.set("n", "gR", vim.lsp.buf.references, { desc = "Search symbol references" })
        end,
    },
}
