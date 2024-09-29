local M = {}
local default_opts = { noremap = true, silent = true }

M.general = function()
   -- toggle numbers (with relative line numbers)
   vim.keymap.set("n", "<leader>n", '<cmd>set rnu! nu!<CR>', default_opts)

   -- use j and k to move through wrapped lines
   vim.keymap.set("n", "k", 'v:count ? "k" : "gk"', { silent = true, expr = true })
   vim.keymap.set("n", "j", 'v:count ? "j" : "gj"', { silent = true, expr = true })

   -- Yank into system clipboard
   vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', default_opts)
   vim.keymap.set({ 'n', 'v' }, '<leader>Y', '"+Y', default_opts)

   -- Delete into system clipboard
   vim.keymap.set({ 'n', 'v' }, '<leader>d', '"+d', default_opts)
   vim.keymap.set({ 'n', 'v' }, '<leader>D', '"+D', default_opts)

   -- Paste from system clipboard
   vim.keymap.set({ 'n', "v" }, '<leader>p', '"+p', default_opts)
   vim.keymap.set({ 'n', "v" }, '<leader>P', '"+P', default_opts)

   -- move text around
   vim.keymap.set({ "x", "v" }, "<S-j>", ":m '>+1<CR>gv-gv", default_opts)
   vim.keymap.set({ "x", "v" }, "<S-k>", ":m '<-2<CR>gv-gv", default_opts)

   -- stay in visual mode when indenting
   vim.keymap.set("v", "<", "<gv", default_opts)
   vim.keymap.set("v", ">", ">gv", default_opts)

   -- remove trailing whitespace
   vim.keymap.set("n", "<leader>tw", "mt<cmd>%s/\\s\\+$//e<CR>`t", default_opts)

   -- run custom 'build' command
   vim.keymap.set("n", "<leader>r", "@r")
end

M.diagnostics = function()
   local diagnostics_opts = { silent = true, noremap = true }
   vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, diagnostics_opts)
   vim.keymap.set("n", "]d", vim.diagnostic.goto_next, diagnostics_opts)
   vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, diagnostics_opts)
   vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, diagnostics_opts)
end

M.lsp = function(bufnr)
   local lsp_opts = { silent = true, noremap = true, buffer = bufnr }
   vim.keymap.set({ "n", "i", }, "<ctrl>h", vim.lsp.buf.signature_help, lsp_opts)
   vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, lsp_opts)
   vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, lsp_opts)
   vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, lsp_opts)
   vim.keymap.set("n", "<leader>lk", vim.lsp.buf.hover, lsp_opts)
   vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, lsp_opts)
   vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, lsp_opts)
   vim.keymap.set("n", "<leader>lR", vim.lsp.buf.references, lsp_opts)
   vim.keymap.set(
      "n",
      "<leader>f",
      function()
         vim.lsp.buf.format({
            formatting_options = {
               tabSize = 3,
               insertleaders = true,
               trimTrailingWhiteleader = true,
            },
         })
      end,
      lsp_opts
   )
end

return M
