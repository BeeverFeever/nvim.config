require("options")

vim.pack.add({
   { src = "https://github.com/rebelot/kanagawa.nvim" },

   { src = "https://github.com/windwp/nvim-ts-autotag" },
   { src = "https://github.com/Saghen/blink.cmp",                 version = vim.version.range("1.*") },
   { src = "https://github.com/ibhagwan/fzf-lua" },
   { src = "https://github.com/nvim-tree/nvim-web-devicons" },
   { src = "https://github.com/neovim/nvim-lspconfig" },
   { src = "https://github.com/williamboman/mason.nvim" },
   { src = "https://github.com/williamboman/mason-lspconfig.nvim" },
   { src = "https://github.com/echasnovski/mini.pairs" },
   { src = "https://github.com/stevearc/oil.nvim" },
   { src = "https://github.com/hedyhli/outline.nvim" },
   { src = "https://github.com/nvim-treesitter/nvim-treesitter",  version = "main" },
})

local default_opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>O", "<cmd>Outline<CR>", default_opts)

require("plugins/kanagawa")
require("plugins/oil")
require("plugins/fzf")
require("plugins/blink")
require("plugins/lsp")

require("mini.pairs").setup()
require("nvim-ts-autotag").setup()
require("outline").setup()
