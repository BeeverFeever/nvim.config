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
      border = "single",
      source = "always",
      header = "",
      prefix = "",
   }
}

-- vim.diagnostic.config(diagnostic_config)
require("options.keymaps").diagnostics()

return {
   {
      "neovim/nvim-lspconfig",
      events = { "InsertEnter", "BufReadPost", "BufNewFile" },
      dependencies = {
         -- why does this need the empty opts?? it doesn't work without them though so they are here i guess
         { "williamboman/mason.nvim", opts = {} },
         { "williamboman/mason-lspconfig.nvim", opts = {} },
         "hrsh7th/cmp-nvim-lsp",
      },
      config = function()
         local lspconfig = require("lspconfig")
         local ms_lspconfig = require("mason-lspconfig")
         local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

         ms_lspconfig.setup_handlers({
            function(server_name)
               lspconfig[server_name].setup({
                  capabilites = lsp_capabilities,
               })
            end,

            ["html"] = function()
               local capabilities = vim.lsp.protocol.make_client_capabilities()
               capabilities.textDocument.completion.completionItem.snippetSupport = true

               lspconfig.html.setup({
                  capabilities = capabilities,
               })
            end,

            ["lua_ls"] = function()
               lspconfig.lua_ls.setup({
                  capabilities = lsp_capabilities,
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
         })

         vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
               require("options.keymaps").lsp(event.buf)
            end,
         })

         vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
         vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })
      end,
   },

   {
      "williamboman/mason-lspconfig.nvim",
      dependencies = { "neovim/nvim-lspconfig" },
   },
}
