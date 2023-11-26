local M = {}

M.nord = function()
    local nord = utils.get_package("nord")
    nord.setup({
        on_highlights = function (highlights, colours)
            highlights.Winbar = { link = "StatusLine" }
            highlights.WinbarNC = { link = "StatusLineNC" }
            highlights.NonText = { fg = colours.polar_night.brightest }
        end,
    })
end

return M
