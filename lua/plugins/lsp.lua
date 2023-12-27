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

local default_setup = function(server)
    lspconfig[server].setup({
        capabilites = lsp_capabilities,
    })
end

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = globals.border_style }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = globals.border_style }
)

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




-------------------------------
---------completions-----------
-------------------------------

local snippy = require("snippy")
local cmp = require("cmp")

cmp.setup({
    sources = {
        { name = "nvim_lsp", },
        { name = "buffer" },
        { name = "path" },
    },

    window = {
        completion = {
            border = globals.border
        },
        documentation = {
            border = globals.border
        }
    },

    mapping = {
        ["<C-j>"]   = cmp.mapping.select_next_item(),
        ["<C-k>"]   = cmp.mapping.select_prev_item(),
        ["<C-e>"]   = cmp.mapping.close(),
        ["<CR>"]    = cmp.mapping.confirm(),
        ["<Tab>"]   = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif not snippy.can_expand_or_advance() then
                fallback()
            end
            snippy.expand_or_advance()
        end, { "i", "s", }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif not snippy.can_jump(-1) then
                fallback()
            end
            snippy.previous()
        end, { "i", "s", }),
    },

    snippet = {
        expand = function(args)
            snippy.expand_snippet(args.body)
        end,
    },
})
