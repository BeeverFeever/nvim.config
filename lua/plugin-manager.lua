local lazy = utils.get_package("lazy")

lazy.setup({
    spec = "plugins",
    defaults = {
        lazy = false,
    },
    change_detection = {
        enabled = false,
    },
})
