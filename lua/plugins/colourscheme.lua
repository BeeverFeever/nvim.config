local M = {}

M.nord = function()
    require("nord").setup()
    vim.cmd.colorscheme("nord")
end

M.dracula = function ()
    require("dracula").setup()
    vim.cmd.colorscheme("dracula")
end

M.everforest = function ()
    require("everforest").setup()
    vim.cmd.colorscheme("everforest")
end

return M
