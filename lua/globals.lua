utils = {}
settings = {}

utils.get_package = function(pkg_name)
    local ok, package = pcall(require, pkg_name)
    if not ok then
        print(string.format("ERROR: could not require %s", pkg_name))
    else
        return package
    end
end

settings = {
    winblend = 0,
    border_style = "single",
    -- border_chars = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
    border_chars = { "+", "-", "+", "|", "+", "-", "+", "|" },

    icons = {
        lsp = {
            ["Class"] = "",
            ["Color"] = "󰏘",
            ["Constant"] = "󰏿",
            ["Constructor"] = "",
            ["Enum"] = "",
            ["EnumMember"] = "",
            ["Event"] = "",
            ["Field"] = "󰜢",
            ["File"] = "",
            ["Folder"] = "",
            ["Function"] = "󰊕",
            ["Interface"] = "",
            ["Keyword"] = "󰌋",
            ["Method"] = "󰆧",
            ["Module"] = "",
            ["Operator"] = "󰆕",
            ["Property"] = "",
            ["Reference"] = "",
            ["Snippet"] = "",
            ["Struct"] = "󰙅",
            ["Text"] = "󰉿",
            ["TypeParameter"] = "",
            ["Unit"] = "",
            ["Value"] = "󰎠",
            ["Variable"] = "󰀫",
        },

        diagnostics = {
            error = "E",
            warn = "W",
            hint = "H",
            info = "I",
        },

        git = {
            added = "",
            conflict = "",
            deleted = "",
            ignored = "◌",
            modified = "",
            removed = "",
            renamed = "➜",
            staged = "",
            unstaged = "✗",
            untracked = "★",
        },

        git_signs = {
            add = '│',
            change = '│',
            delete = '_',
            topdelete = '‾',
            changedelete = '~',
            untracked = '┆',
        },
    },
}
