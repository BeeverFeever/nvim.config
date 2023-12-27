local M = {}

M.nord = function()
    require("nord").setup()
    vim.cmd.colorscheme("nord")
end

return M
