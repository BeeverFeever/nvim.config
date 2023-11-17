local opt = vim.opt
local g = vim.g

g.mapleader = ' '
g.netrw_banner = 0			-- gets rid of the annoying banner for netrw
g.netrw_browse_split=4		-- open in prior window
g.netrw_altv = 1			   -- change from left splitting to right splitting
g.netrw_liststyle=3			-- tree style view in netrw

-- make the cursor stay as block in insert modes
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
opt.ignorecase = true
opt.smartcase = true
opt.clipboard = "unnamedplus"
opt.mouse = "a" -- I don't use my mouse however may aswell make it usable everywhere
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.linebreak = true
opt.showbreak = " ~> "
opt.textwidth = 80
opt.scrolloff = 8
opt.timeoutlen = 300

