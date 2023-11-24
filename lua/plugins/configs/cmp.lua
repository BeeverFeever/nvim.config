local snippy = utils.get_package("snippy")
local cmp = utils.get_package("cmp")
local icons = globals.icons

cmp.setup({
    snippet = {
        expand = function(args)
            snippy.expand_snippet(args.body)
        end,
    },

    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(_, item)
            local kind = item.kind
            item.menu = "(" .. (string.format("%s", item.kind) or "") .. ")"
            item.kind = icons.kind[kind]
            return item
        end,
    },

    sources = {
        {
            name = "nvim_lsp",
            max_item_count = 50,
        },
        { name = "path" },
        { name = "buffer" },
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
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-2),
        ["<C-u>"] = cmp.mapping.scroll_docs(2),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"]  = cmp.mapping.confirm(),
        ["<Tab>"] = cmp.mapping(function(fallback)
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
})
