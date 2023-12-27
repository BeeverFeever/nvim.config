require("mini.trailspace").setup()
require("mini.comment").setup()
require("mini.files").setup({
    mappings = {
        go_in = "",
        go_in_plus = "l",
    },
    windows = {
        preview = false,
        width_focus = 30,
        height_focus = 30,
        border = globals.border_style
    },
    use_as_default_explorer = true,
})

require("mini.pairs").setup()
