return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',

    config = function()
        require("bufferline").setup({
            options = {
                show_tab_indicators = true,
                always_show_bufferline = true,
                separator_style = "thin",
            },

            highlights = {
                -- Empty area around the buffers
                fill = { fg = "#828BB8", bg = "#222436" },
            },
        })

        vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
    end,
}
