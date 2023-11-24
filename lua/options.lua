local opt = vim.opt
local g = vim.g

local M = {}

M.opts = function()
    g.mapleader = ' '

    g.netrw_banner = 0    -- gets rid of the annoying banner for netrw
    g.netrw_altv = 1      -- change from left splitting to right splitting
    g.netrw_liststyle = 3 -- tree style view in netrw

    opt.ruler = false
    opt.confirm = true
    opt.guicursor = ""
    opt.cursorline = true
    opt.swapfile = false
    opt.undofile = true
    opt.fileencoding = "utf-8"
    opt.tabstop = 4
    opt.softtabstop = 4
    opt.shiftwidth = 4
    opt.expandtab = true
    opt.smartindent = true
    opt.pumheight = 20
    opt.ignorecase = true
    opt.smartcase = true
    opt.clipboard = "unnamedplus"
    opt.number = true
    opt.relativenumber = true
    opt.fillchars:append { eob = " " }
    opt.shortmess:append "aIF"
    opt.numberwidth = 2
    opt.splitbelow = true
    opt.splitright = true
    opt.termguicolors = true
    opt.breakindent = true
    opt.linebreak = true
    opt.showbreak = " ~> "
    opt.textwidth = 80
    opt.scrolloff = 8
    opt.timeoutlen = 300
    opt.laststatus = 0
    opt.winbar = "%F %m"
    opt.wildmenu = true

    opt.smoothscroll = true
end

return M
