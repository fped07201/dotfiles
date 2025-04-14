return {
    "catppuccin/nvim",
    name = "cappuccin",
    priority = 1000,
    enabled = false,
    flavour = "mocha",
    config = function()
        vim.cmd.colorscheme("catppuccin")
    end
}

