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
end
