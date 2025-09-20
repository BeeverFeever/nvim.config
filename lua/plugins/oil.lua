-- can get permission colours from https://github.com/Bekaboo/nvim
vim.api.nvim_set_hl(0, "OilFile", { link = "String" })
vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>", { noremap = true, silent = true })

require("oil").setup({
   columns = {
      { 'permissions', highlight = "Boolean" },
      { 'size',        highlight = 'Special' },
      { 'mtime',       highlight = 'Number' },
   },
   keymaps = {
      ["<C-v>"] = "actions.select_vsplit",
      ["<C-s>"] = "actions.select_split",
      ["q"] = "actions.close",
   },
   constrain_cursor = "name",
   view_options = { show_hidden = true, },
})
