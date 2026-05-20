return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        config = function()
            local pattern = {
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
                "go",
                "gomod",
                "gosum",
                "gowork"
            }
            require("nvim-treesitter").install(pattern)
            vim.api.nvim_create_autocmd('FileType', {
                pattern = pattern,
                callback = function(ev)
                    require("nvim-treesitter").install({ ev.match })
                    vim.treesitter.start()
                end,
            })
        end,
        build = function()
            pcall(vim.cmd.TSUpdate)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
