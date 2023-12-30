local snippy = require("snippy")
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
        ["<Tab>"]   = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif not snippy.can_expand_or_advance() then
                fallback()
            end
            snippy.expand_or_advance()
        end, { "i", "s", }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif not snippy.can_jump(-1) then
                fallback()
            end
            snippy.previous()
        end, { "i", "s", }),
    },

    snippet = {
        expand = function(args)
            snippy.expand_snippet(args.body)
        end,
    },
})
