local opt = vim.opt
local g = vim.g

g.mapleader = ' '

opt.autoindent = true
opt.breakindent = true
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.fileencoding = "utf-8"
opt.fillchars:append { eob = " " }
opt.formatoptions = "jcroqlnt" -- "tcqj"
opt.grepprg = "rg --vimgrep"
opt.guicursor = ""
opt.ignorecase = true
opt.iskeyword:append('-')
opt.laststatus = 1
opt.linebreak = true
opt.number = true
opt.numberwidth = 2
opt.pumheight = 20
opt.relativenumber = true
opt.ruler = false
opt.scrolloff = 8
opt.shiftwidth = 4
opt.shortmess:append "aIF"
opt.showbreak = " ~> "
opt.sidescrolloff = 8;
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 4
opt.splitbelow = true
opt.splitright = true
opt.statusline = "%#Normal#%="
opt.swapfile = false
opt.tabstop = 4
opt.termguicolors = true
opt.textwidth = 80
opt.timeoutlen = 300
opt.undofile = true
opt.wildmenu = true
-- I prefer to use the winbar as my statusline
opt.winbar = "%#DiffAdd# %#StatusLine# %F %#DiffAdd# %#Red# %m %#String#%(%r %h %w%) %#Normal# %= %#DiffChange# %l/%L "
opt.wrap = false

vim.api.nvim_command("filetype plugin indent on")
vim.api.nvim_command("syntax on")

-- I get the feeling im going to need this eventually
-- g.markdown_recommend_style = 0
