return {
    -- nvim-lspconfig for setting up LSP servers
    {
        'neovim/nvim-lspconfig',
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- Define LSP key mappings
            local function on_attach(client, bufnr)
                local bufopts = { noremap = true, silent = true, buffer = bufnr }

                vim.diagnostic.config({
                    virtual_text = true, -- shows inline text
                    signs = true,        -- shows gutter signs
                    underline = false,
                    update_in_insert = false,
                })
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
                --     vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                vim.keymap.set('n', 'gn', vim.lsp.buf.rename, bufopts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
                vim.keymap.set('n', '<leader>fo', vim.lsp.buf.format, bufopts)
                vim.keymap.set("v", "<leader>fo", function()
                    vim.lsp.buf.format({
                        range = {
                            ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
                            ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
                        },
                    })
                end, bufopts)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
                vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, bufopts)
                vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end, bufopts)
                vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)

                if client.name == "clangd" then
                    vim.api.nvim_buf_create_user_command(bufnr, "ClangdSwitchSourceHeader", function()
                        local params = { uri = vim.uri_from_bufnr(0) }

                        client.request("textDocument/switchSourceHeader", params, function(err, result)
                            if err then
                                vim.notify("Clangd error: " .. err.message, vim.log.levels.ERROR)
                                return
                            end
                            if not result then
                                vim.notify("No corresponding source/header file found", vim.log.levels.INFO)
                                return
                            end
                            vim.cmd("edit " .. vim.uri_to_fname(result))
                        end, bufnr)
                    end, { desc = "Switch between header/source using clangd" })

                    vim.keymap.set(
                        'n',
                        '<A-o>',
                        '<cmd>ClangdSwitchSourceHeader<CR>',
                        { buffer = bufnr, noremap = true, silent = true, desc = "Switch between header/source" }
                    )
                end

                if client.server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                    vim.keymap.set("n", "<leader>th", function()
                        local bufnr = 0
                        vim.lsp.inlay_hint.enable(
                            not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
                            { bufnr = bufnr }
                        )
                    end, { desc = "Toggle inlay hints" })
                end
            end
            -- LSP server configs
            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
                            diagnostics = { globals = { 'vim' } },
                            workspace = { library = vim.api.nvim_get_runtime_file('', true) },
                            telemetry = { enable = false },
                        },
                    },
                },
                clangd = {
                    cmd = { "clangd", "--background-index", "--clang-tidy", "--compile-commands-dir=build", "--header-insertion=never" },
                    filetypes = { "c", "cpp", "cc", "cxx", "h", "hpp", "m", "mm" },
                },
                pyright = {},
                ruff = {},
                bashls = {},
                cmake = {},
                yamlls = {},
                gitlab_ci_ls = {},
            }

            -- Configure servers using the new vim.lsp.config API
            for name, opts in pairs(servers) do
                opts = vim.tbl_deep_extend("force", { on_attach = on_attach, capabilities = capabilities }, opts)
                vim.lsp.config(name, opts) -- define/configure the server
                vim.lsp.enable(name)       -- enable it for its filetypes
            end
        end
    },

    -- Mason plugin for managing LSP servers
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end
    },

    -- Mason-lspconfig for automatic LSP server installation
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', 'clangd', 'bashls', 'cmake', 'pyright', 'ruff', 'yamlls', 'gitlab_ci_ls' },
            })
        end
    },

}
