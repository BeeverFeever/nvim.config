--------------------------------
---------bootstrap lazy---------
--------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)




---------------------------------
---------install plugins---------
---------------------------------

require("lazy").setup({
        {
            "gbprod/nord.nvim",
            priority = 1000,
        },

        {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "dcampos/nvim-snippy",
        },

        {
            "ibhagwan/fzf-lua",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            config = function()
                require("options.keymaps").fzf()
            end
        },

        {
            "NeogitOrg/neogit",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "ibhagwan/fzf-lua",
            },
        },

        "lewis6991/gitsigns.nvim",

        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function()
                local treesitter = require("nvim-treesitter.configs")
                treesitter.setup({
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
            end,
        },

        {
            "folke/drop.nvim",
            lazy = true,
            event = "VimEnter",
        },

        {
            "folke/zen-mode.nvim",
            lazy = true,
            keymaps = { "<leader>zz" }
        },

        {
            "echasnovski/mini.nvim",
            name = "mini",
            version = false,
            config = function()
                require("options.keymaps").mini()
            end,
        },

        {
            "renerocksai/telekasten.nvim",
            lazy = true,
            ft = "markdown",
            dependencies = {
                "nvim-telescope/telescope.nvim",
                "renerocksai/calendar-vim"
            },
        },
    },




    -------------------------------
    ---------lazy settings---------
    -------------------------------
    {
        concurrency = 4,
        change_detection = {
            enabled = false,
        },
    })
