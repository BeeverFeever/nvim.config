local lspconfig = utils.get_package("lspconfig")
local nvim_lsp = utils.get_package("cmp_nvim_lsp")

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
utils.get_package("keymaps").diagnostics()

local lsp_capabilities =  nvim_lsp.default_capabilities()
local inlay_hint = vim.lsp.inlay_hint.enable

local lsp_attach = function(client, bufnr)
    utils.get_package("keymaps").lsp(bufnr)
    if client.supports_method("textDocument/inlayHint") and inlay_hint then
        inlay_hint(bufnr, true)
    end
end

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
