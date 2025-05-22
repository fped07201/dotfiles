return {
  "tpope/vim-commentary",
  lazy = false,

  config = function()
    -- Set `//` for C and C++
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c", "cpp" },
      callback = function()
        vim.bo.commentstring = "// %s"
      end,
    })

    -- If you want `/** %s */` instead, use:
    -- vim.bo.commentstring = "/** %s */"
  end,
}

