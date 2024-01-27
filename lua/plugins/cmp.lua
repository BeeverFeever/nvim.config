local snippy = require("snippy")
local cmp = require("cmp")

cmp.setup({
    sources = {
        { name = "nvim_lsp", },
        { name = "buffer" },
        { name = "snippy" },
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
        ["<CR>"]    = cmp.mapping.confirm({ select = false }),
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

    snippet = function(args)
        snippy.expand_snippet(args.body)
    end,
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
