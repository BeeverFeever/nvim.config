return {
   "nvim-treesitter/nvim-treesitter",
   build = ":TSUpdate",
   events = { "BufReadPost", "BufNewFile" },
   config = function()
      require("nvim-treesitter.configs").setup({
         ensure_installed = {
            "c",
            "go",
            "lua",
            "vim",
            "vimdoc",
         },
         highlight = { enable = true, },
      })
   end,
}
