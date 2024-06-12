return {
   {
      "rebelot/kanagawa.nvim",
      priority = 1000,
      config = function()
         require("kanagawa").setup({
            colors = {
               theme = {
                  all = {
                     ui = { bg_gutter = "none" }
                  },
               },
            },
            overrides = function(colors)
               local theme = colors.theme
               return {
                  Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
                  PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                  PmenuSbar = { bg = theme.ui.bg_m1 },
                  PmenuThumb = { bg = theme.ui.bg_p2 },
               }
            end,
         })
         vim.cmd.colorscheme("kanagawa-dragon")
      end,
   },

   {
      "catpuccin/nvim",
      enabled = false,
      name = "catpuccin",
      priority = 1000,
      config = function() vim.cmd.colorscheme("catpuccin-mocha") end,
   },
}
