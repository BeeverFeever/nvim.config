local M = {}
local default_opts = { noremap = true, silent = true }
local set_keymaps = function(map_table)
    for _, v in pairs(map_table) do
        vim.keymap.set(v[1], v[2], v[3], v[4])
    end
end

M.general = function()
    local general_mappings = {
        -- switch between windows
        { "n",          "<A-h>",     "<C-w>h",                        default_opts },
        { "n",          "<A-l>",     "<C-w>l",                        default_opts },
        { "n",          "<A-j>",     "<C-w>j",                        default_opts },
        { "n",          "<A-k>",     "<C-w>k",                        default_opts },
        { "n",          "<leader>w", "<C-w>",                         default_opts },

        -- resize windows
        -- TODO: find a way to make these fucking logical becase these are just
        -- annoying to use
        -- also i dont want to use the plugin because fuck more plugins
        { "n",          "<A-S-k>",   "<cmd>resize -2<CR>",            default_opts },
        { "n",          "<A-S-j>",   "<cmd>resize +2<CR>",            default_opts },
        { "n",          "<A-S-l>",   "<cmd>vertical resize -2<CR>",   default_opts },
        { "n",          "<A-S-h>",   "<cmd>vertical resize +2<CR>",   default_opts },

        -- toggle numbers (with relative line numbers)
        { "n",          "<leader>n", '<cmd>set rnu! nu!<CR>',         default_opts },

        -- use j and k to move through wrapped lines
        -- from https://stackoverflow.com/questions/20975928/moving-the-cursor-through-long-soft-wrapped-lines-in-vim
        { "n",          "k",         'v:count ? "k" : "gk"',          { silent = true, expr = true } },
        { "n",          "j",         'v:count ? "j" : "gj"',          { silent = true, expr = true } },

        -- does some pasting magic, got it from NvChad
        { "v",          "p",         'p:let @+=@0<CR>:let @"=@0<CR>', default_opts },

        -- move text around
        { { "x", "v" }, "<S-j>",     ":m '>+1<CR>gv-gv",              default_opts },
        { { "x", "v" }, "<S-k>",     ":m '<-2<CR>gv-gv",              default_opts },

        -- stay in visual mode when indenting
        { "v",          "<",         "<gv",                           default_opts },
        { "v",          ">",         ">gv",                           default_opts },
    }
    set_keymaps(general_mappings)
end

M.diagnostics = function()
    local diagnostics_opts = { silent = true, noremap = true }
    local diagnostics_mappings = {
        { "n", "<space>e", vim.diagnostic.open_float, diagnostics_opts },
        { "n", "]d",       vim.diagnostic.goto_next,  diagnostics_opts },
        { "n", "[d",       vim.diagnostic.goto_prev,  diagnostics_opts },
        { "n", "<space>q", vim.diagnostic.setloclist, diagnostics_opts },
    }
    set_keymaps(diagnostics_mappings)
end

M.lsp = function(bufnr)
    local lsp_opts = { silent = true, noremap = true, buffer = bufnr }
    local lsp_mappings = {
        { "n",          "<leader>ih", function() vim.lsp.inlay_hint.enable(nil, false) end, lsp_opts },
        { "n",          "<leader>lD", vim.lsp.buf.declaration,                              lsp_opts },
        { "n",          "<leader>ld", vim.lsp.buf.definition,                               lsp_opts },
        { "n",          "<leader>lt", vim.lsp.buf.type_definition,                          lsp_opts },
        { "n",          "<leader>li", vim.lsp.buf.implementation,                           lsp_opts },
        { "n",          "<leader>lk", vim.lsp.buf.hover,                                    lsp_opts },
        { "n",          "<leader>lK", vim.lsp.buf.signature_help,                           lsp_opts },
        { "n",          "<leader>ln", vim.lsp.buf.rename,                                   lsp_opts },
        { "n",          "<leader>la", vim.lsp.buf.code_action,                              lsp_opts },
        { "n",          "<leader>lr", vim.lsp.buf.references,                               lsp_opts },
        { { "i", "n" }, "<C-h>",      vim.lsp.buf.signature_help,                           lsp_opts }, -- this does override the original binding for <C-h> but i never use it(mainly because i didnt know it existed before now).
        {
            "n",
            "<leader>f",
            function()
                vim.lsp.buf.format({
                    formatting_options = {
                        tabSize = 4,
                        insertleaders = true,
                        trimTrailingWhiteleader = true,
                    },
                })
            end,
            lsp_opts,
        },
    }
    set_keymaps(lsp_mappings)
end

M.mini = function()
    local mini_opts = default_opts
    local mini_mappings = {
        { "n", "<leader>o", "<cmd>lua MiniFiles.open()<CR>", mini_opts },
    }
    set_keymaps(mini_mappings)
end

M.fzf = function()
    local fzf_opts = default_opts
    local fzf_mappings = {
        { "n", "<leader>ff", "<cmd>FzfLua files<CR>",        fzf_opts },
        { "n", "<leader>fg", "<cmd>FzfLua lgrep_curbuf<CR>", fzf_opts },
    }
    set_keymaps(fzf_mappings)
end

return M
