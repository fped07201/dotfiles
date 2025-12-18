return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-live-grep-args.nvim'
    },
    config = function()
        local telescope = require('telescope')
        telescope.setup {
            defaults = {
                layout_strategy = "vertical",
                sorting_strategy = "ascending",
                layout_config = {
                    prompt_position = "top",
                    vertical = {
                        mirror = true,
                        -- preview_cutoff = 0,
                        -- preview_height = 0.35,
                    },
                },
                extensions = {
                    live_grep_args = {}
                }
            }
        }
        telescope.load_extension('live_grep_args')
        vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>fg", ":Telescope live_grep_args<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>fw", ":Telescope grep_string<CR>", { noremap = true, silent = true })
    end
}
