globals = {
    border_style = "double",
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

function globals.is_git_repo()
    local is_repo = vim.fn.system("git rev-parse --is-inside-work-tree")

    return vim.v.shell_error == 0
end
