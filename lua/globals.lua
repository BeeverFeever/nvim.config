utils = {}
globals = {}
local M = {}

M.lazyload = function(lazypath)
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "--single-branch",
            "https://github.com/folke/lazy.nvim.git",
            lazypath,
        })
        print("You probably most likely need to restart nvim now")
        return true
    end
    vim.opt.runtimepath:prepend(lazypath)
end

utils.get_package = function(pkg_name)
    local ok, package = pcall(require, pkg_name)
    if not ok then
        print(string.format("ERROR: could not require %s", pkg_name))
    else
        return package
    end
end

globals = {
    border_style = "single",
    border_chars = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },

    icons = {
        kind = {
            Class = "",
            Color = "󰏘",
            Constant = "󰏿",
            Constructor = "",
            Enum = "",
            EnumMember = "",
            Event = "",
            Field = "󰜢",
            File = "",
            Folder = "",
            Function = "󰊕",
            Interface = "",
            Keyword = "󰌋",
            Method = "󰆧",
            Module = "",
            Operator = "󰆕",
            Property = "",
            Reference = "",
            Snippet = "",
            Struct = "󰙅",
            Text = "󰉿",
            TypeParameter = "",
            Unit = "",
            Value = "󰎠",
            Variable = "󰀫",
        },

        diagnostics = {
            error = "E",
            warn = "W",
            hint = "H",
            info = "I",
        },
    },
}

return M
