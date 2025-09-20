require("kanagawa").setup({
   colors = {
      theme = {
         all = {
            ui = { bg_gutter = "none" }
         },
      },
   },
   overrides = function(colors)
      local current_theme = colors.theme
      return {
         NormalDark = { fg = current_theme.ui.fg_dim, bg = current_theme.ui.bg_m3 },
         -- Pmenu = { link = "NormalDark" },
         Pmenu = { fg = current_theme.ui.bg_m3, bg = "NONE" },
         PmenuSel = { fg = current_theme.ui.shade0, bg = current_theme.ui.bg_p1 },
         PmenuKind = { link = "NormalDark" },
         -- PmenuSel = { fg = "NONE", bg = current_theme.ui.bg_p2 },
         -- PmenuSbar = { bg = current_theme.ui.bg_m1 },
         -- PmenuThumb = { bg = current_theme.ui.bg_p2 },
         BlinkCmpMenuBorder = { fg = current_theme.ui.bg_m3, bg = "NONE" },
      }
   end,
})

vim.cmd.colorscheme("kanagawa-dragon")
