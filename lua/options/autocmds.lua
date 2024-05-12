-- Thanks LazyVim
local function augroup(name)
   return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
   group = augroup("close_with_q"),
   pattern = {
      "PlenaryTestPopup",
      "help",
      "lspinfo",
      "man",
      "notify",
      "qf",
      "query",
      "spectre_panel",
      "startuptime",
      "tsplayground",
      "neotest-output",
      "checkhealth",
      "neotest-summary",
      "neotest-output-panel",
   },
   callback = function(event)
      vim.bo[event.buf].buflisted = false
      vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
   end,
})

-- Set some options in text and markdown files
vim.api.nvim_create_autocmd("FileType", {
   group = augroup("wrap_spell"),
   pattern = { "gitcommit", "markdown", "text" },
   callback = function()
      vim.opt_local.wrap = true
      vim.opt_local.spell = true
      vim.opt_local.rnu = false
      vim.opt_local.nu = false
   end,
})

-- Disable semantic highlighting, I don't really like this way of doing it but I
-- don't know enough about the lsp to do it any other way. Also this is in the
-- nvim help so yeah
vim.api.nvim_create_autocmd("Colorscheme", {
   callback = function()
      for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
         vim.api.nvim_set_hl(0, group, {})
      end
   end
})

-- force glsl filetype for vert and frag shader files
-- for some reason they default to conf files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
   group = augroup("filetypedetect"),
   pattern = { "*.vert", "*.frag" },
   callback = function()
      vim.cmd.setfiletype("glsl")
   end
})
