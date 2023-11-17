local M = {}

function M.kanagawa()
    local kana = utils.get_package("kanagawa")

    kana.setup({
        compile = false,
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = { bold = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = { bold = true },
        transparent = false,
        dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        theme = "wave",
        background = {
            dark = "wave",
            light = "lotus",
        },
        colors = {
            theme = {
                wave = {
                    ui = {
                        bg = "#181616", -- darker background for wave
                    },
                },
                all = {
                    ui = {
                        bg_gutter = "none",
                        -- fg = "#54546D"
                    },
                },
            },
        },
        overrides = function(colors)
            return {
                Pmenu                    = { fg = colors.theme.ui.shade0, bg = colors.palette.dragonBlack4 },
                PmenuSel                 = { fg = "NONE", bg = colors.theme.ui.bg_p2 },
                PmenuSbar                = { bg = colors.theme.ui.bg_m1 },
                PmenuThumb               = { bg = colors.theme.ui.bg_p2 },
                -- I think I can make this more general for any colourscheme
                -- however I can't be bothered to do that right now and I don't
                -- plan on changing from this amazing colourscheme
                CmpItemAbbrDeprecated    = { fg = colors.palette.katanaGray,    bg = "NONE", strikethrough = true },
                CmpItemAbbrMatch         = { fg = colors.palette.boatYellow2,   bg = "NONE", bold = true },
                CmpItemAbbrMatchFuzzy    = { fg = colors.palette.boatYellow2,   bg = "NONE", bold = true },
                CmpItemMenu              = { fg = colors.palette.oniViolet,     bg = "NONE", italic = true },
                CmpItemKindField         = { fg = colors.palette.fujiWhite,     },-- bg = colors.palette.peachRed },
                CmpItemKindProperty      = { fg = colors.palette.fujiWhite,     },-- bg = colors.palette.peachRed },
                CmpItemKindEvent         = { fg = colors.palette.fujiWhite,     },-- bg = colors.palette.peachRed },
                CmpItemKindText          = { fg = colors.palette.springGreen,   },-- bg = colors.palette.fujiWhite },
                CmpItemKindEnum          = { fg = colors.palette.oniViolet,     },-- bg = colors.palette.fujiWhite },
                CmpItemKindKeyword       = { fg = colors.palette.oniViolet,     },-- bg = colors.palette.fujiWhite },
                CmpItemKindConstant      = { fg = colors.palette.surimiOrange,  },-- bg = colors.palette.fujiWhite },
                CmpItemKindConstructor   = { fg = colors.palette.surimiOrange,  },-- bg = colors.palette.fujiWhite },
                CmpItemKindReference     = { fg = colors.palette.surimiOrange,  },-- bg = colors.palette.fujiWhite },
                CmpItemKindFunction      = { fg = colors.palette.crystalBlue,   },-- bg = colors.palette.fujiWhite },
                CmpItemKindStruct        = { fg = colors.palette.boatYellow2,   },-- bg = colors.palette.fujiWhite },
                CmpItemKindClass         = { fg = colors.palette.boatYellow2,   },-- bg = colors.palette.fujiWhite },
                CmpItemKindModule        = { fg = colors.palette.boatYellow2,   },-- bg = colors.palette.fujiWhite },
                CmpItemKindOperator      = { fg = colors.palette.boatYellow2,   },-- bg = colors.palette.fujiWhite },
                CmpItemKindVariable      = { fg = colors.palette.waveAqua2,     },-- bg = colors.palette.fujiWhite },
                CmpItemKindFile          = { fg = colors.palette.waveAqua2,     },-- bg = colors.palette.fujiWhite },
                CmpItemKindUnit          = { fg = colors.palette.springBlue,    },-- bg = colors.palette.fujiWhite },
                CmpItemKindSnippet       = { fg = colors.palette.springBlue,    },-- bg = colors.palette.fujiWhite },
                CmpItemKindFolder        = { fg = colors.palette.springBlue,    },-- bg = colors.palette.fujiWhite },
                CmpItemKindMethod        = { fg = colors.palette.sakuraPink,    },-- bg = colors.palette.fujiWhite },
                CmpItemKindValue         = { fg = colors.palette.sakuraPink,    },-- bg = colors.palette.fujiWhite },
                CmpItemKindEnumMember    = { fg = colors.palette.sakuraPink,    },-- bg = colors.palette.fujiWhite },
                CmpItemKindInterface     = { fg = colors.palette.springViolet2, },-- bg = colors.palette.fujiWhite },
                CmpItemKindColor         = { fg = colors.palette.springViolet2, },-- bg = colors.palette.fujiWhite },
                CmpItemKindTypeParameter = { fg = colors.palette.springViolet2, },-- bg = colors.palette.fujiWhite },
                FloatTitle               = { --[[ cterm = "bold" ,]] italic = true, fg = "#ff9e3b", bg = "#16161D" },
                WinSeparator             = { fg = colors.theme.ui.nontext },
            }
        end,
    })

    -- vim.cmd("colorscheme kanagawa")
end

return {
    "rebelot/kanagawa.nvim",
    -- high priority for colourschemes
    priority = 1000,
    config = function()
        M.kanagawa()
    end,
}
