return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-live-grep-args.nvim'
    },
    config = function()
        local telescope = require('telescope')
        telescope.setup {
            extensions = {
                live_grep_args = {}
            }
        }
        telescope.load_extension('live_grep_args')
        -- Map Ctrl + P to Telescope's find_files function
        vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", { noremap = true, silent = true })
        -- Ctrl + F for live grep args (allows custom arguments)
        vim.keymap.set("n", "<C-f>", ":Telescope live_grep_args<CR>", { noremap = true, silent = true })
        -- Ctrl + B for buffers
        vim.keymap.set("n", "<C-b>", ":Telescope buffers<CR>", { noremap = true, silent = true })
    end
}

