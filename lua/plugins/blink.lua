require("blink.cmp").setup({
   signature = { enabled = true, },
   sources = { default = { "lsp", "path", "buffer" }, },
   keymap = { preset = "super-tab", },
   completion = {
      list = {
         selection = {
            preselect = function(ctx)
               return not require('blink.cmp').snippet_active({ direction = 1 })
            end,
         },
      },
   },
})
