return {
    'akinsho/toggleterm.nvim', version = "*",
    config = function()
      require("toggleterm").setup{
        size = 20,  -- Optional: Adjust terminal size
        open_mapping = [[<C-t>]],  -- Set the keybinding to Ctrl + t
        direction = "horizontal",  -- You can set it to "vertical", "float", or "horizontal"
	shade_terminals = false,
      }

    -- Set terminal background color
    vim.cmd([[ 
      highlight TermBg guibg=#1e1e1e 
      highlight TermCursor guifg=#ffffff guibg=#ff0000
    ]])
    end
}

