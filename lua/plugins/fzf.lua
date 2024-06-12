return {
   "ibhagwan/fzf-lua",
   keys = {
      { mode = "n", "<leader>ff", "<cmd>FzfLua files<CR>", },
      { mode = "n", "<leader>fg", "<cmd>FzfLua grep_project<CR>", },
   },
   dependencies = { "nvim-tree/nvim-web-devicons" },
   opts = {
      winopts = {
         split = "belowright new",
         border = "single",
         preview = {
            horizontal = 'right:45%',
            layout = 'horizontal',
         },
      },
   },
}
