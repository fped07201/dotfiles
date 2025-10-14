return {
    -- nvim-lspconfig for setting up LSP servers
    {
        'neovim/nvim-lspconfig',
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require('lspconfig')

            -- Define LSP key mappings
            local function on_attach(client, bufnr)
                local bufopts = { noremap = true, silent = true, buffer = bufnr }

                -- Ensure LSP functions are available
                if vim.lsp.buf.definition then
                    -- Go to definition
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                end

                if vim.lsp.buf.declaration then
                    -- Go to declaration
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
                end

                if vim.lsp.buf.type_definition then
                    -- Go to type definition
                    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
                end

                if vim.lsp.buf.references then
                    -- Find references
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                end

                if vim.lsp.buf.rename then
                    -- Rename symbol
                    vim.keymap.set('n', 'gn', vim.lsp.buf.rename, bufopts)
                end

                if vim.lsp.buf.hover then
                    -- Show hover information
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                end

                if vim.lsp.buf.signature_help then
                    -- Signature help
                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
                end

                if vim.lsp.buf.format then
                    -- Format document
                    vim.keymap.set('n', '<leader>fo', vim.lsp.buf.format, bufopts)
                end

                if vim.lsp.buf.code_action then
                    -- Code actions
                    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
                end

                if vim.diagnostic.goto_prev then
                    -- Show diagnostics
                    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
                end

                if vim.diagnostic.goto_next then
                    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
                end

                if vim.diagnostic.open_float then
                    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)
                end
                if client.name == "clangd" then
                    vim.keymap.set(
                        'n',
                        '<A-o>',
                        '<cmd>ClangdSwitchSourceHeader<CR>',
                        { buffer = bufnr, noremap = true, silent = true, desc = "Switch between header/source" }
                    )
                end
            end

            -- Lua LSP setup
            lspconfig.lua_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT', -- Lua version (LuaJIT for Neovim)
                            path = vim.split(package.path, ';'), -- Set Lua runtime path
                        },
                        diagnostics = {
                            globals = { 'vim' }, -- Recognize 'vim' as a global
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file('', true), -- Use Neovim runtime files as the workspace
                        },
                        telemetry = {
                            enable = false, -- Disable telemetry
                        },
                    },
                },
            })

            -- C++ LSP setup (using clangd)
            lspconfig.clangd.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                cmd = { "clangd", "--background-index", "--clang-tidy", "--compile-commands-dir=build", "--header-insertion=never" },  -- You can customize the command line options here
                filetypes = { "c", "cpp", "cc", "cxx", "m", "mm" },  -- Specify C++ related file types
                settings = {
                    clangd = {
                        -- Additional settings for clangd can be added here if needed
                    },
                },
            })
            -- Python LSP setup (using pylsp)
            lspconfig.pylsp.setup({
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                enabled = false,
                                ignore = { "E271", "E401", "E221", "E501", "E261" }
                            },
                            pyflakes = { enabled = true },
                            rope_completion = { enabled = true },
                            black = { enabled = true }, -- optional: enable if installed
                        }
                    }
                }
            })
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
                ensure_installed = { 'lua_ls', 'clangd' },  -- Ensure both Lua and C++ LSPs are installed
            })
        end
    },
}

