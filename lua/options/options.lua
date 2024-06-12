vim.g.mapleader = ' '

vim.opt.formatoptions = "jcroqlnt" -- "tcqj"
vim.opt.termguicolors = true
vim.opt.guicursor = ""
vim.opt.conceallevel = 3
vim.opt.scrolloff = 10
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.timeoutlen = 300
vim.opt.pumheight = 10
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 3
vim.opt.softtabstop = 3
vim.opt.tabstop = 3
vim.opt.statusline = "%#Normal#%="
vim.opt.cmdheight = 0
vim.opt.laststatus = 3

-- custom winbar, I prefer to use the winbar as my statusline
-- set_winbar = function()
--    local modes = {
--       ["n"]  = 'normal',
--       ["no"] = 'normal,op',
--       ["v"]  = 'visual',
--       ["V"]  = 'v-line',
--       ["^V"] = 'v-block',
--       ["s"]  = 'select',
--       ["S"]  = 's-line',
--       ["^S"] = 's-block',
--       ["i"]  = 'insert',
--       ["R"]  = 'replace',
--       ["Rv"] = 'v-replace',
--       ["c"]  = 'command',
--       ["cv"] = 'vim ex',
--       ["ce"] = 'ex',
--       ["r"]  = 'prompt',
--       ["rm"] = 'more',
--       ["r?"] = 'confirm',
--       ["!"]  = 'shell',
--       ["t"]  = 'terminal'
--    }
--
--    local mode = modes[vim.api.nvim_get_mode()['mode']]
--    return "%#IncSearch# %#StatusLine# %F %#IncSearch# %#Red# %m %#String#%(%r %h %w%) %#Normal# %= %#String#" .. mode .. " %#StatusLine# %l/%L "
-- end
-- vim.opt.winbar = "%!v:lua.set_winbar()"
macro = function()
   local reg = vim.fn.reg_recording()
   if reg == "" then
      return ""
   else
      return "Recording @" .. reg
   end
end
vim.opt.winbar = "%#IncSearch# %#StatusLine# %F %#IncSearch# %#Red# %m %#String#%(%r %h %w%) %#Normal# %= %{v:lua.macro()} %#StatusLine# %l/%L "
