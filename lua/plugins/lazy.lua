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
            lazy = true,
            priority = 1000,
        },

        {
            "neanias/everforest-nvim",
            lazy = true,
            priority = 1000,
        },





        -------------------
        --------LSP--------
        -------------------
        {
            "hrsh7th/nvim-cmp",
            lazy = true,
            event = "InsertEnter",
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-cmdline",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-buffer",
                "dcampos/nvim-snippy",
            },
            config = function()
                require("plugins.cmp")
            end,
        },

        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",





        --------------------
        -----FUNCTIONAL-----
        --------------------
        {
            "ibhagwan/fzf-lua",
            dependencies = { "nvim-tree/nvim-web-devicons" },
        },

        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
        },

        {
            "echasnovski/mini.pairs",
            version = false,
        },

        {
            "echasnovski/mini.trailspace",
            version = false,
        },

        {
            "echasnovski/mini.comment",
            version = false,
        },

        {
            "stevearc/oil.nvim",
            dependencies = "nvim-tree/nvim-web-devicons",
        },

        {
            "renerocksai/telekasten.nvim",
            lazy = true,
            ft = "markdown",
            event = "BufEnter *.md",
            dependencies = {
                "nvim-lua/plenary.nvim", -- required for telescope not telekasten
                "nvim-telescope/telescope.nvim",
                "renerocksai/calendar-vim"
            },
            config = function()
                require("plugins.telekasten")
            end
        },




        --------------------
        ------COSMETIC------
        --------------------

        "lewis6991/gitsigns.nvim",

        {
            "folke/zen-mode.nvim",
            opts = {
                window = {
                    options = {
                        signcolumn = "no",
                        number = false,
                        relativenumber = false,
                    }
                }
            }
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
