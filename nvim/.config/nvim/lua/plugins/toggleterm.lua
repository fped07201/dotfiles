return {
    'akinsho/toggleterm.nvim',
    version = "*",
    enabled = true,
    config = function()
        require("toggleterm").setup {
            size = 20,                -- Optional: Adjust terminal size
            open_mapping = [[<C-t>]], -- Set the keybinding to Ctrl + t
            direction = "horizontal", -- You can set it to "vertical", "float", or "horizontal"
            shade_terminals = false,
        }

        -- Set terminal background color
        vim.cmd([[
          highlight TermBg guibg=#1e1e1e
          highlight TermCursor guifg=#ffffff guibg=#ff0000
        ]])

        -- Create a reusable floating terminal instance
        local Terminal = require("toggleterm.terminal").Terminal
        local float_term = Terminal:new({ direction = "float", hidden = true })

        -- Toggle it with <leader>t
        vim.keymap.set("n", "<leader>t", function()
            float_term:toggle()
        end, { desc = "Toggle floating terminal" })

        vim.keymap.set("t", "<leader>t", function()
            float_term:toggle()
        end, { desc = "Toggle floating terminal from terminal mode" })
    end
}
