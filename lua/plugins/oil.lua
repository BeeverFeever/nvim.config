-- Thank you https://github.com/Bekaboo/nvim for the colours.
vim.api.nvim_set_hl(0, "OilDir", { link = "Directory" })
vim.api.nvim_set_hl(0, "OilDirIcon", { link = "Directory" })
vim.api.nvim_set_hl(0, "OilLink", { link = "Constant" })
vim.api.nvim_set_hl(0, "OilLinkTarget", { link = "Comment" })
vim.api.nvim_set_hl(0, "OilCopy", { link = "DiagnosticSignHint", bold = true })
vim.api.nvim_set_hl(0, "OilMove", { link = "DiagnosticSignWarn", bold = true })
vim.api.nvim_set_hl(0, "OilChange", { link = "DiagnosticSignWarn", bold = true })
vim.api.nvim_set_hl(0, "OilCreate", { link = "DiagnosticSignInfo", bold = true })
vim.api.nvim_set_hl(0, "OilDelete", { link = "DiagnosticSignError", bold = true })
vim.api.nvim_set_hl(0, "OilPermissionNone", { link = "NonText" })
vim.api.nvim_set_hl(0, "OilPermissionRead", { link = "DiagnosticSignWarn" })
vim.api.nvim_set_hl(0, "OilPermissionWrite", { link = "DiagnosticSignError" })
vim.api.nvim_set_hl(0, "OilPermissionExecute", { link = "DiagnosticSignOk" })
vim.api.nvim_set_hl(0, "OilTypeDir", { link = "Directory" })
vim.api.nvim_set_hl(0, "OilTypeFifo", { link = "Special" })
vim.api.nvim_set_hl(0, "OilTypeFile", { link = "NonText" })
vim.api.nvim_set_hl(0, "OilTypeLink", { link = "Constant" })
vim.api.nvim_set_hl(0, "OilTypeSocket", { link = "OilSocket" })

local type_hlgroups = setmetatable({
   ['-'] = 'OilTypeFile',
   ['d'] = 'OilTypeDir',
   ['p'] = 'OilTypeFifo',
   ['l'] = 'OilTypeLink',
   ['s'] = 'OilTypeSocket',
}, {
   __index = function()
      return 'OilTypeFile'
   end,
})

local permission_hlgroups = setmetatable({
   ['-'] = 'OilPermissionNone',
   ['r'] = 'OilPermissionRead',
   ['w'] = 'OilPermissionWrite',
   ['x'] = 'OilPermissionExecute',
}, {
   __index = function()
      return 'OilDir'
   end,
})

require("oil").setup({
   columns = {
      {
         'type',
         icons = {
            directory = 'd',
            fifo = 'p',
            file = '-',
            link = 'l',
            socket = 's',
         },
         highlight = function(type_str)
            return type_hlgroups[type_str]
         end,
      },
      {
         'permissions',
         highlight = function(permission_str)
            local hls = {}
            for i = 1, #permission_str do
               local char = permission_str:sub(i, i)
               table.insert(hls, { permission_hlgroups[char], i - 1, i })
            end
            return hls
         end,
      },
      { 'size',  highlight = 'Special' },
      { 'mtime', highlight = 'Number' },
   },
   keymaps = {
      ["<C-v>"] = "actions.select_vsplit",
      ["<C-s>"] = "actions.select_split",
      ["q"] = "actions.close",
   },
   -- Set to false to disable all of the above keymaps
   use_default_keymaps = true,
   view_options = {
      show_hidden = true,
   },
   float = {
      border = globals.border_style,
   },
   preview = {
      border = globals.border_style,
   },
   progress = {
      border = globals.border_style,
   },
})
