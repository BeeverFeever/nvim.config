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
         NormaFloat = { bg = "NONE" },
         FloatFooter = { bg = "NONE" },
         -- Pmenu = { link = "NormalDark" },
         Pmenu = { fg = current_theme.ui.bg_m3, bg = "NONE" },
         -- PmenuSel = { bg = "NONE", bold = true },
         PmenuKind = { link = "NormalDark" },
         PmenuSel = { fg = "NONE", bg = current_theme.ui.bg_p2 },
         -- PmenuSbar = { bg = current_theme.ui.bg_m1 },
         -- PmenuThumb = { bg = current_theme.ui.bg_p2 },
         BlinkCmpMenuBorder = { fg = current_theme.ui.bg_m3, bg = "NONE" },
         -- WinSeparator = { fg = current_theme.ui.bg_m3, bg = "NONE" },
         StatusLine = { fg = "NONE", bg = "NONE" },
         MsgArea = { fg = colors.palette.dragonBlue },
         MatchParen = { fg = colors.palette.springGreen },
      }
   end,
})

vim.cmd.colorscheme("kanagawa-dragon")
