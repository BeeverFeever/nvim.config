vim.g.mapleader = ' '

vim.opt.fillchars = { stl = "─", stlnc = "─" }
vim.opt.formatoptions = "jcroqlnt" -- "tcqj"
vim.opt.termguicolors = true
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
vim.opt.numberwidth = 1
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 3
vim.opt.softtabstop = 3
vim.opt.tabstop = 3
vim.opt.statusline = "%#VertSplit#%="
vim.opt.cmdheight = 0
vim.opt.laststatus = 0

-- custom winbar, I prefer to use the winbar as my statusline
macro = function()
   local reg = vim.fn.reg_recording()
   if reg == "" then
      return ""
   else
      return "Recording @" .. reg
   end
end
vim.opt.winbar = "%#IncSearch# %#StatusLine# %F %#IncSearch# %#Red# %m %#String#%(%r %h %w%) %#Normal# %= %{v:lua.macro()} %#StatusLine# %l/%L "
