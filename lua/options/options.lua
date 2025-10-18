vim.g.mapleader = ' '

vim.opt.cmdheight = 0
vim.opt.conceallevel = 3
vim.opt.expandtab = true
vim.opt.formatoptions = "jcroqlnt" -- "tcqj"
vim.opt.ignorecase = true
vim.opt.laststatus = 3
vim.opt.linebreak = true
-- deal with sensitive scrolling on wayland only in nvim for some reason
vim.opt.mousescroll = "ver:1,hor:6"
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 3
vim.opt.sidescroll = 5
vim.opt.smartcase = true
vim.opt.softtabstop = 3
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.statusline = "%#DiagnosticWarn#"
vim.opt.swapfile = false
vim.opt.tabstop = 3
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.winborder = "single"
vim.opt.wrap = false

-- custom winbar, I prefer to use the winbar as my statusline
macro = function()
   local reg = vim.fn.reg_recording()
   if reg == "" then
      return ""
   else
      return "Recording @" .. reg
   end
end

vim.opt.winbar = "%#IncSearch# %#StatusLine# %F %#IncSearch# %#DiagnosticWarn# %m %#DiagnosticOk#%(%r %h %w%) %= %{v:lua.macro()} %#DiagnosticInfo# %l/%L "
