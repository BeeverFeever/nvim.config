return {
    "numToStr/Comment.nvim",
    keys = { 
        "gcc", 
        { "gc", "gc", mode = "v" } 
    },
    config = function(_, opts)
        local comment = utils.get_package("Comment")
        comment.setup({
            padding = true,
            sticky = true,
            ignore = "^$",
            toggler = {
                line = 'gcc',
                block = 'gbc',
            },
            opleader = {
                line = 'gc',
                block = 'gb',
            },
            extra = {
                above = 'gcO',
                below = 'gco',
                eol = 'gcA',
            },
            mappings = {
                basic = true,
                extra = true,
                extended = false,
            },
            pre_hook = nil,
            post_hook = nil,
        })
    end,
}
