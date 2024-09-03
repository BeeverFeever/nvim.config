return {
   "hrsh7th/nvim-cmp",
   event = { "InsertEnter", "CmdlineEnter", },
   dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
   },
   config = function()
      local cmp = require("cmp")

      cmp.setup({
         sources = {
            { name = "nvim_lsp", },
            { name = "buffer" },
            { name = "path" },
         },
         mapping = {
            ["<C-j>"]   = cmp.mapping.select_next_item(),
            ["<C-k>"]   = cmp.mapping.select_prev_item(),
            ["<C-e>"]   = cmp.mapping.close(),
            ["<CR>"]    = cmp.mapping.confirm({ select = false }),
            ["<Tab>"]   = cmp.mapping(function(fallback)
               if cmp.visible() then
                  cmp.select_next_item()
               else
                  fallback()
               end
            end, { "i", "s", }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
               if cmp.visible() then
                  cmp.select_prev_item()
               else
                  fallback()
               end
            end, { "i", "s", }),
         },
      })

      cmp.setup.cmdline({ '/', '?' }, {
         mapping = cmp.mapping.preset.cmdline(),
         sources = {
            { name = 'buffer' }
         }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
         mapping = cmp.mapping.preset.cmdline(),
         sources = cmp.config.sources({
            { name = 'path' }
         }, {
            { name = 'cmdline' }
         })
      })

   end,
}
