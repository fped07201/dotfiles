-- Set leader key to Control (if needed)
vim.g.mapleader = ","

--- Ctrl +a to select all
vim.keymap.set('n', '<C-a>', 'ggVG', { noremap = true, silent = true })

--- Keymaps for window navigation in Neovim
vim.api.nvim_set_keymap('n', '<C-w>h', '<C-w>h', { noremap = true, silent = true }) -- Move left
vim.api.nvim_set_keymap('n', '<C-w>j', '<C-w>j', { noremap = true, silent = true }) -- Move down
vim.api.nvim_set_keymap('n', '<C-w>k', '<C-w>k', { noremap = true, silent = true }) -- Move up
vim.api.nvim_set_keymap('n', '<C-w>l', '<C-w>l', { noremap = true, silent = true }) -- Move right

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

