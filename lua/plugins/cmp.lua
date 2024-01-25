local cmp = require("cmp")

cmp.setup({
    sources = {
        { name = "nvim_lsp", },
        { name = "buffer" },
        { name = "path" },
    },

    window = {
        completion = {
            border = globals.border
        },
        documentation = {
            border = globals.border
        }
    },

    mapping = {
        ["<C-j>"]   = cmp.mapping.select_next_item(),
        ["<C-k>"]   = cmp.mapping.select_prev_item(),
        ["<C-e>"]   = cmp.mapping.close(),
        ["<CR>"]    = cmp.mapping.confirm(),
        ["<Tab>"]   = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item()
            end
        end, { "i", "s", }),
        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            end
        end, { "i", "s", }),
    },
})
