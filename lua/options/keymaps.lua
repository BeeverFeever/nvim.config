local M = {}
local default_opts = { noremap = true, silent = true }
local set_keymaps = function(map_table)
   for _, v in pairs(map_table) do
      vim.keymap.set(v[1], v[2], v[3], v[4])
   end
end

M.general = function()
   set_keymaps({
      -- toggle numbers (with relative line numbers)
      { "n",          "<leader>n",   '<cmd>set rnu! nu!<CR>',          default_opts },

      -- use j and k to move through wrapped lines
      { "n",          "k",           'v:count ? "k" : "gk"',           { silent = true, expr = true } },
      { "n",          "j",           'v:count ? "j" : "gj"',           { silent = true, expr = true } },

      -- does some pasting magic, got it from NvChad
      { "v",          "p",           'p:let @+=@0<CR>:let @"=@0<CR>',  default_opts },

      -- move text around
      { { "x", "v" }, "<S-j>",       ":m '>+1<CR>gv-gv",               default_opts },
      { { "x", "v" }, "<S-k>",       ":m '<-2<CR>gv-gv",               default_opts },

      -- stay in visual mode when indenting
      { "v",          "<",           "<gv",                            default_opts },
      { "v",          ">",           ">gv",                            default_opts },

      { "n",          "<leader>z",   "<cmd>ZenMode<CR>",               default_opts },
      { "n",          "<leader>o",   "<cmd>Oil<CR>",                   default_opts },

      { "n",          "<leader>ff",  "<cmd>FzfLua files<CR>",          default_opts },
      { "n",          "<leader>fg",  "<cmd>FzfLua grep_project<CR>",   default_opts },

      { "n",          "<leader>tw",  "<cmd>%s/\\s\\+$//e<CR><C-o>", default_opts },

      { "n",          "<leader>zbr", "<cmd>!zig build run<CR>",        default_opts },
   })
end

M.diagnostics = function()
   local diagnostics_opts = { silent = true, noremap = true }
   set_keymaps({
      { "n", "<space>e", vim.diagnostic.open_float, diagnostics_opts },
      { "n", "]d",       vim.diagnostic.goto_next,  diagnostics_opts },
      { "n", "[d",       vim.diagnostic.goto_prev,  diagnostics_opts },
      { "n", "<space>q", vim.diagnostic.setloclist, diagnostics_opts },
   })
end

M.lsp = function(bufnr)
   local lsp_opts = { silent = true, noremap = true, buffer = bufnr }
   set_keymaps({
      { "n", "<leader>lD", vim.lsp.buf.declaration,    lsp_opts },
      { "n", "<leader>ld", vim.lsp.buf.definition,     lsp_opts },
      { "n", "<leader>li", vim.lsp.buf.implementation, lsp_opts },
      { "n", "<leader>lk", vim.lsp.buf.hover,          lsp_opts },
      { "n", "<leader>ls", vim.lsp.buf.signature_help, lsp_opts },
      { "i", "<ctrl>h",    vim.lsp.buf.signature_help, lsp_opts },
      { "n", "<leader>lr", vim.lsp.buf.rename,         lsp_opts },
      { "n", "<leader>la", vim.lsp.buf.code_action,    lsp_opts },
      { "n", "<leader>lR", vim.lsp.buf.references,     lsp_opts },
      {
         "n",
         "<leader>f",
         function()
            vim.lsp.buf.format({
               formatting_options = {
                  tabSize = 3,
                  insertleaders = true,
                  trimTrailingWhiteleader = true,
               },
               async = true,
            })
         end,
         lsp_opts,
      },
   })
end

return M
