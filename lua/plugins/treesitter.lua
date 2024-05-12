require("nvim-treesitter.configs").setup({
   ensure_installed = {
      "c",
      "go",
      "lua",
      "vim",
      "vimdoc",
   },
   auto_install = true,
   highlight = {
      enable = true,
   }
})
