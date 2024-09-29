if colourscheme == "kanagawa" then
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
                  local current_theme = colors.theme
                  local dragon_theme = require("kanagawa.colors").setup({ theme = "dragon" }).theme
                  return {
                     bg = { bg = dragon_theme.bg },
                     Pmenu = { fg = current_theme.ui.shade0, bg = current_theme.ui.bg_p1 },
                     PmenuSel = { fg = "NONE", bg = current_theme.ui.bg_p2 },
                     PmenuSbar = { bg = current_theme.ui.bg_m1 },
                     PmenuThumb = { bg = current_theme.ui.bg_p2 },
                  }
               end,
            })
            vim.cmd.colorscheme("kanagawa")
         end,
      }
   }

elseif colourscheme == "catpuccin" then
   return {
      "catpuccin/nvim",
      name = "catpuccin",
      priority = 1000,
      config = function() vim.cmd.colorscheme("catpuccin-mocha") end,
   }

elseif colourscheme == "rose-pine" then
   return {
      "rose-pine/neovim",
      name = "rose-pine",
      priority = 1000,
      config = function () vim.cmd.colorscheme("rose-pine") end,
   }
elseif colourscheme == "habamax" then
   vim.cmd.colorscheme("habamax")

   vim.api.nvim_set_hl(0, "Normal", { bg = "#181818" })
   vim.api.nvim_set_hl(0, "FloatNormal", { link = "Normal" })
   vim.api.nvim_set_hl(0, "Pmenu", { link = "#151515" })
   vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
   vim.api.nvim_set_hl(0, "VertSplit", { link = "LineNr" })
   vim.api.nvim_set_hl(0, "StatusLine", { link = "CursorLine" })
   vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "none", bg = "DarkGrey" })
   vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "Green" })
   vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "DarkYellow" })
   vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "DarkRed" })
   vim.api.nvim_set_hl(0, "TabLine", { fg = "none", bg = "none" })
   vim.api.nvim_set_hl(0, "TabLineFill", { fg = "DarkGrey", bg = "none" })
   vim.api.nvim_set_hl(0, "TabLineSel", { fg = "White", bg = "none" })
   vim.api.nvim_set_hl(0, "Visual", { link = "CursorLine" })
   vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "orange" })
   vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "red" })
   vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "LightBlue" })
   vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "LightGrey" })
   vim.api.nvim_set_hl(0, "DiagnosticUnderlineOk", { undercurl = true, sp = "LightGreen" })
   vim.api.nvim_set_hl(0, "ModeMsg", {bg = "none", fg = "LightGreen"})

   return {}
end

