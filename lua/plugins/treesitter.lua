return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
        local treesitter = utils.get_package("nvim-treesitter.configs")
        treesitter.setup({
            ensure_installed = {
                "vimdoc",
                "lua",
                "c",
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                addition_vim_regex_highlighting = false,
            }
        })
    end,
}
