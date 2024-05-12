require("fzf-lua").setup({
   winopts = {
      split = "belowright new",
      border = globals.border_style,
      preview = {
         horizontal = 'right:45%',
         layout = 'horizontal',
      },
   },
   defaults = {
      preview = false,
   }
})
