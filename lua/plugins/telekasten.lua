require("telekasten").setup({
   home = vim.fn.expand("~/notes"),
})

require("telescope").setup({
   defaults = {
      borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' , }
   }
})
