require("mason").setup()
require("mason-lspconfig").setup()

vim.diagnostic.config({
   signs = true,
   update_in_insert = true,
   severity_sort = true,
   underline = true,
   float = {
      focusable = false,
      border = "single",
      source = "if_many",
      header = "",
      prefix = "",
   }
})

require("options.keymaps").diagnostics()

-- ms_lspconfig.setup_handlers({
   -- ["html"] = function()
   --    local capabilities = vim.lsp.protocol.make_client_capabilities()
   --    capabilities.textDocument.completion.completionItem.snippetSupport = true
   --
   --    lspconfig.html.setup({
   --       capabilities = capabilities,
   --    })
   -- end,
-- })

vim.lsp.config["clangd"] = {
   cmd = {"clangd", "--background-index", "--clang-tidy", "--log=verbose" },
   init_options = {
      fallbackFlags = { "-std=c23" },
   }
}

vim.lsp.config["lua_ls"] = {
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
}

vim.api.nvim_create_autocmd("LspAttach", {
   callback = function(event)
      require("options.keymaps").lsp(event.buf)
   end,
})
