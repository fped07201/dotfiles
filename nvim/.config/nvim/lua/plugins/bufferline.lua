return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup {
            options = {
                show_tab_indicators = true,
                always_show_bufferline = true,
            }
        }
    end
}
