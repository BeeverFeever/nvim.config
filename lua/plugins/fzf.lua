vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>")
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua grep_project<CR>")

require("fzf-lua").setup({
   -- to send all results to qf list
   keymap = {
      fzf = {
         true,
         ["ctrl-q"] = "select-all+accept",
      },
   },
   winopts = {
      split = "belowright new",
      border = "single",
      preview = {
         horizontal = 'right:45%',
         layout = 'horizontal',
      },
   },
})
