-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
   pattern = {
      "help",
      "lspinfo",
      "qf",
   },
   callback = function(event)
      vim.bo[event.buf].buflisted = false
      vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
   end,
})

-- Set some options in text and markdown files could do this with the ftplugin folder but i like this more
vim.api.nvim_create_autocmd("FileType", {
   pattern = { "gitcommit", "markdown", "text" },
   callback = function()
      vim.opt_local.breakindent = true
      vim.opt_local.wrap = true
      vim.opt_local.spell = true
      vim.opt_local.rnu = false
      vim.opt_local.nu = false
   end,
})

-- Disable semantic highlighting
vim.api.nvim_create_autocmd("ColorScheme", {
   callback = function()
      for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
         vim.api.nvim_set_hl(0, group, {})
      end
   end
})

vim.api.nvim_create_autocmd("FileType", {
   pattern = { "c", "glsl", "cpp" },
   callback = function() vim.opt.commentstring = "// %s" end
})

-- force glsl filetype for vert and frag shader files
-- for some reason they default to conf files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
   pattern = { "*.vert", "*.frag" },
   callback = function() vim.cmd.setfiletype("glsl") end
})
