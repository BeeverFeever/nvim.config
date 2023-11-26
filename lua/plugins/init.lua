local lazy = utils.get_package("lazy")

local plugins = {
    {
        "gbprod/nord.nvim",
        lazy = false,
        priority = 1000,
        config = function ()
            require("plugins.configs.colourscheme").nord()
            vim.cmd.colorscheme("nord")
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "dcampos/cmp-snippy",
            "dcampos/nvim-snippy",
        },
        event = { "LspAttach", "InsertEnter", "CmdlineEnter" },
        opts = function()
            require("plugins.configs.cmp")
        end,
    },

    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUpdate" },
        config = function()
            utils.get_package("mason").setup()
        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        opts = {
            enusre_installed = {
                "clangd",
                "lua_ls",
            },
        },
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        cmd = { "LspInfo", "LspInstall" },
        event = { "BufRead", "BufWinEnter", "BufNewFile" },
        config = function()
            require("plugins.configs.lsp")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        cmd = { "TSInstall", "TSModuleInfo" },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local treesitter = utils.get_package("nvim-treesitter.configs")
            treesitter.setup({
                ensure_installed = {
                    "vimdoc",
                    "lua",
                    "c",
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    -- addition_vim_regex_highlighting = false,
                }
            })
        end,
    },

    {
        "echasnovski/mini.nvim",
        name = "mini",
        version = false,
        event = { "InsertEnter" },
        keys = { "gc", "ggc", "<leader>o" },
        config = function()
            local mini_config = require("plugins.configs.mini")
            local mini_modules = {
                "comment",
                "files",
                "pairs",
            }
            require("keymaps").mini()
            for _, module in ipairs(mini_modules) do
                require("mini." .. module).setup(mini_config[module])
            end
        end,
    },

    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
        keys = {},
        config = function ()
            require("keymaps").fzf()
            require("plugins.configs.fzf")
        end
    },
}

lazy.setup(plugins, require("plugins.configs.lazy"))
