vim.loader.enable()

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
require("globals").lazyload(lazypath)

require("options").opts()
require("keymaps").general()
require("plugins")
