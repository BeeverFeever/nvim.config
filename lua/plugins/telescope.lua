return {
    "nvim-telescope/telescope.nvim",
    -- branch = "0.1.x",
    dependencies = {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = 'make',
        },
    },
    opts = function()
        local telescope = utils.get_package("telescope")
        local actions = utils.get_package("telescope.actions")

        -- return {
        --     defaults = {
        --         vimgrep_arguments = {
        --             "rg",
        --             "--color=never",
        --             "--no-heading",
        --             "--with-filename",
        --             "--line-number",
        --             "--column",
        --             "--smart-case",
        --         },
        --         prompt_prefix = " ~> ",
        --         selection_caret = "  ",
        --         entry_prefix = "   ",
        --         initial_mode = "insert",
        --         selection_strategy = "reset",
        --         sorting_strategy = "ascending",
        --         layout_strategy = "horizontal",
        --         layout_config = {
        --             horizontal = {
        --                 prompt_position = "top",
        --                 preview_width = 0.55,
        --                 results_width = 0.8,
        --             },
        --             vertical = {
        --                 mirror = false,
        --             },
        --             width = 0.87,
        --             height = 0.80,
        --             preview_cutoff = 120,
        --         },
        --         -- preview = true,
        --         file_sorter = require("telescope.sorters").get_fuzzy_file,
        --         file_ignore_patterns = { "node_modules" },
        --         generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        --         path_display = { "truncate" },
        --         results_title = "Hmm show me what you got :)",
        --         prompt_title = "Search me :)",
        --         winblend = settings.winblend,
        --         border = true,
        --         borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        --         color_devicons = true,
        --         set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        --         file_previewer = require("telescope.previewers").cat.new,
        --         grep_previewer = require("telescope.previewers").vimgrep.new,
        --         qflist_previewer = require("telescope.previewers").qflist.new,
        --         -- Developer configurations: Not meant for general override
        --         buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        --         mappings = {
        --             i = {
        --                 -- ["<C-n>"] = actions.cycle_history_next,
        --                 -- ["<C-p>"] = actions.cycle_history_prev,
        --                 ["<Up>"] = actions.cycle_history_next,
        --                 ["<Down>"] = actions.cycle_history_prev,

        --                 ["<C-j>"] = actions.move_selection_next,
        --                 ["<C-k>"] = actions.move_selection_previous,

        --                 ["<C-e>"] = actions.close,

        --                 -- ["<Down>"] = actions.move_selection_next,
        --                 -- ["<Up>"] = actions.move_selection_previous,

        --                 ["<CR>"] = actions.select_default,
        --                 ["<C-x>"] = actions.select_horizontal,
        --                 ["<C-v>"] = actions.select_vertical,
        --                 -- ["<C-t>"] = actions.select_tab,

        --                 ["<C-u>"] = actions.preview_scrolling_up,
        --                 ["<C-d>"] = actions.preview_scrolling_down,

        --                 -- ["<PageUp>"] = actions.results_scrolling_up,
        --                 -- ["<PageDown>"] = actions.results_scrolling_down,

        --                 ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        --                 ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        --                 ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        --                 ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        --                 ["<C-l>"] = actions.complete_tag,
        --                 -- ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
        --             },

        --             n = {
        --                 ["<esc>"] = actions.close,
        --                 ["<CR>"] = actions.select_default,
        --                 ["<C-x>"] = actions.select_horizontal,
        --                 ["<C-v>"] = actions.select_vertical,
        --                 -- ["<C-t>"] = actions.select_tab,

        --                 ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        --                 ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        --                 ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        --                 ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        --                 ["j"] = actions.move_selection_next,
        --                 ["k"] = actions.move_selection_previous,
        --                 ["H"] = actions.move_to_top,
        --                 ["M"] = actions.move_to_middle,
        --                 ["L"] = actions.move_to_bottom,

        --                 -- ["<Down>"] = actions.move_selection_next,
        --                 -- ["<Up>"] = actions.move_selection_previous,
        --                 ["gg"] = actions.move_to_top,
        --                 ["G"] = actions.move_to_bottom,

        --                 ["<C-u>"] = actions.preview_scrolling_up,
        --                 ["<C-d>"] = actions.preview_scrolling_down,

        --                 ["<Up>"] = actions.results_scrolling_up,
        --                 ["<Down>"] = actions.results_scrolling_down,

        --                 -- ["?"] = actions.which_key,
        --             }
        --         },
        --         extensions = {
        --             fzf = {}
        --         },
        --     }
        -- }
    end,
    config = function(_, opts)
        local telescope = utils.get_package("telescope")

        telescope.setup(opts)
        telescope.load_extension("fzf")

        utils.get_package("keymaps").telescope()
    end,
}
