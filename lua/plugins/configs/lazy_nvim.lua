return {
    defaults = {
        lazy = true,
    },
    concurrency = 4,
    install = {
        colorscheme = { "nord" },
    },
    change_detection = {
        enabled = false,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "netrwPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
                "man",
                "matchparen",
                "tarPlugin",
                "rplugin",
            },
        },
    },
}
