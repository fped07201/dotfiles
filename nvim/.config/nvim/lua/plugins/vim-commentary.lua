return {
    "tpope/vim-commentary",
    lazy = false,

    config = function()
        -- Set `//` for C and C++
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "c", "cpp" },
            callback = function()
                vim.bo.commentstring = "// %s"
                -- Map gcC to use /** */ style
                vim.keymap.set("n", "gcC", function()
                    local cs = vim.bo.commentstring
                    vim.bo.commentstring = "/* %s */"
                    vim.cmd("Commentary") -- comment current line
                    vim.bo.commentstring = cs -- restore
                end, { buffer = true })

                -- Visual mode support for gcC
                vim.keymap.set("x", "gcC", function()
                    local cs = vim.bo.commentstring
                    vim.bo.commentstring = "/* %s */"
                    vim.cmd("'<,'>Commentary") -- comment selected lines
                    vim.bo.commentstring = cs
                end, { buffer = true })
            end,
        })

        -- If you want `/** %s */` instead, use:
        -- vim.bo.commentstring = "/** %s */"
    end,
}
