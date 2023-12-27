require("telescope").setup({
    defaults = {
        borderchars = globals.border_chars,
    }
})

require("telekasten").setup({
    home = vim.fn.expand("~/notes"),
})
