return {
    {
        "williamboman/mason.nvim",
        config = function()
            utils.get_package("mason").setup()
        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            enusre_installed = {
                "clangd",
                "lua_ls",
            },
        },
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lsp_attach = function(client, bufnr)
                -- set the lsp keymaps
                utils.get_package("keymaps").lsp(bufnr)
            end

            local lspconfig = require("lspconfig")
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        on_attach = lsp_attach,
                        capabilites = lsp_capabilities,
                    })
                end,
                ["lua_ls"] = function()
                    lspconfig.lua_ls.setup {
                        on_attach = lsp_attach,
                        capabilities = lsp_capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },
                                },
                                telemetry = {
                                    enable = false,
                                },
                            },
                        },
                    }
                end,
            })

            -- setup diagnostics
            local signs = {
                { name = "DiagnosticSignInfo",  text = settings.icons.diagnostics.info },
                { name = "DiagnosticSignHint",  text = settings.icons.diagnostics.hint },
                { name = "DiagnosticSignWarn",  text = settings.icons.diagnostics.warn },
                { name = "DiagnosticSignError", text = settings.icons.diagnostics.error },
            }
            -- set the diagnostic icons
            for _, sign in ipairs(signs) do
                vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
            end

            local config = {
                virtual_text = {
                    prefix = "",
                },
                signs = true,
                update_in_insert = true,
                severity_sort = true,
                underline = true,
                float = {
                    focusable = true,
                    style = "minimal",
                    border = settings.border_style,
                    source = "always",
                    header = "",
                    prefix = "",
                }
            }

            vim.diagnostic.config(config)
            utils.get_package("keymaps").diagnostics()
        end
    },
}
