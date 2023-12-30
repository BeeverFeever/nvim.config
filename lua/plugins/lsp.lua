-------------------------------
---------diagnostics-----------
-------------------------------

local diagnostic_config = {
    signs = true,
    update_in_insert = true,
    severity_sort = true,
    underline = true,
    float = {
        focusable = true,
        style = "minimal",
        border = globals.border_style,
        source = "always",
        header = "",
        prefix = "",
    }
}

vim.diagnostic.config(diagnostic_config)
require("options.keymaps").diagnostics()




-------------------------------
-------------LSP---------------
-------------------------------

local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        require("options.keymaps").lsp(event.buf)
    end,
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = globals.border_style }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = globals.border_style }
)

local default_setup = function(server)
    lspconfig[server].setup({
        capabilites = lsp_capabilities,
    })
end

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {},
    handlers = {
        default_setup,
        lua_ls = function()
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT"
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })
        end,
    }
})
