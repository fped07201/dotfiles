return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
    -- Map Ctrl + P to Telescope's find_files function
    vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", { noremap = true, silent = true })
    -- Ctrl + F for live grep (search text in files)
    vim.keymap.set("n", "<C-f>", ":Telescope live_grep<CR>", { noremap = true, silent = true })
    -- Ctrl + B for buffers
    vim.keymap.set("n", "<C-b>", ":Telescope buffers<CR>", { noremap = true, silent = true })
    end
}


