vim.api.nvim_create_autocmd('FileType', {
   callback = function(args)
      local ok, parser = pcall(vim.treesitter.get_parser, args.buf)
      if ok and parser then
         pcall(vim.treesitter.start)
         -- vim.opt[args.buf].syntax = "on"
      end
      -- I rarely even use folding so idek why I put this here.
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
   end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
   pattern = {
      "help",
      "lspinfo",
      "qf",
      "gitsings",
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

vim.api.nvim_create_autocmd("FileType", {
   pattern = { "c", "glsl", "cpp" },
   callback = function() vim.opt.commentstring = "// %s" end
})

-- Disable semantic highlighting
vim.api.nvim_create_autocmd("ColorScheme", {
   callback = function()
      for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
         vim.api.nvim_set_hl(0, group, {})
      end
   end
})

-- force glsl filetype for vert and frag shader files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
   pattern = { "*.vert", "*.frag" },
   callback = function() vim.cmd.setfiletype("glsl") end
})

vim.api.nvim_create_autocmd({ "QuickFixCmdPost" }, {
   callback = function () vim.cmd.cope() end
})
