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
                fill                  = { fg = "#828BB8", bg = "#222436" },              -- Empty area around the buffers
                background            = { fg = "#828BB8", bg = "#222436" },              -- Inactive buffers
                buffer_visible        = { fg = "#828BB8", bg = "#222436" },              -- Currently visible but not selected
                buffer_selected       = { fg = "#C8D3F5", bg = "#2F334D", bold = true }, -- Selected buffer

                separator             = { fg = "#222436", bg = "#222436" },              -- Separators between buffers
                separator_selected    = { fg = "#2F334D", bg = "#2F334D" },

                close_button          = { fg = "#828BB8", bg = "#222436" }, -- Close buttons
                close_button_visible  = { fg = "#828BB8", bg = "#222436" },
                close_button_selected = { fg = "#C8D3F5", bg = "#2F334D" },

                modified              = { fg = "#FFC777", bg = "#222436" }, -- Modified buffers
                modified_visible      = { fg = "#FFC777", bg = "#222436" },
                modified_selected     = { fg = "#FFC777", bg = "#2F334D" },
            },

        })

        vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
    end,
}
