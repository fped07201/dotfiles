return {
    "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        vim.filetype.add({
            filename = {
                ["wscript"] = "python", -- Treat wscript files as Python
            },
        })

        configs.setup({
          ensure_installed = { "cpp", "lua", "html", "python", "yaml", "json", "csv", "bash", "t32" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
        -- Enable folding with Tree-sitter
        vim.o.foldmethod = "expr"
        vim.o.foldexpr = "nvim_treesitter#foldexpr()"
        vim.o.foldlevel = 99  -- Keeps folds open by default
        vim.o.foldenable = true

    end
}
