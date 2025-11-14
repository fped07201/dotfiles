return {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
        { "-", function() require("oil").open() end, mode = { 'n' }, desc = "Open parent dir" },
    },
    opts = {
        default_file_explorer = true,
        view_options = {
            show_hidden = true,
        },
    },
}
