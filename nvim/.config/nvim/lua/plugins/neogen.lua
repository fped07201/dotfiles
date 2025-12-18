return {
    "danymat/neogen",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("neogen").setup({
            enabled = true,
            input_after_comment = true, -- jump to placeholders
            snippet_engine = "luasnip", -- or "vsnip"/"ultisnips"/nil
            languages = {
                cpp = {
                    template = {
                        annotation_convention = "doxygen",
                    },
                },
                c = {
                    template = {
                        annotation_convention = "doxygen",
                    },
                },
            },
        })
    end,
    vim.keymap.set("n", "<leader>ng",
        function()
            require("neogen").generate()
        end,
        { desc = "Generate documentation (neogen)" }
    )
}
