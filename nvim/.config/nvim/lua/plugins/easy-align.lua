return {
    'junegunn/vim-easy-align',
    event = 'VeryLazy',
    config = function()
        vim.keymap.set('x', '<Leader>a', '<Plug>(EasyAlign)', { desc = 'EasyAlign (Visual)' })
        -- vim.keymap.set('n', '<Leader>a', '<Plug>(EasyAlign)', { desc = 'EasyAlign (Normal)' })
    end,
}
