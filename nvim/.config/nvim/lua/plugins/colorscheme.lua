return {
    {
        "Mofiqul/dracula.nvim",
        enabled = true,
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd.colorscheme("dracula")
        end
    },
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        enabled = true,
        config = function()
            vim.cmd.colorscheme("tokyonight")
        end
    },
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        enabled = true,
        config = function()
            -- vim.cmd.colorscheme("kanagawa")
        end
    },
    {
        "catppuccin/nvim",
        name = "cappuccin",
        priority = 1000,
        enabled = true,
        flavour = "mocha",
        config = function()
            -- vim.cmd.colorscheme("catppuccin")
        end
    }
}
