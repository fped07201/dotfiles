return {
    'akinsho/toggleterm.nvim',
    version = "*",
    enabled = true,
    config = function()
        require("toggleterm").setup {
            open_mapping = [[<C-t>]], -- Set the keybinding to Ctrl + t
            direction = "float", -- You can set it to "vertical", "float", or "horizontal"
            shade_terminals = false,
        }
    end
}
