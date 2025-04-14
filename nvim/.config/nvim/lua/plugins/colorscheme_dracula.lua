return {
    "Mofiqul/dracula.nvim",
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("dracula")
    end
}
