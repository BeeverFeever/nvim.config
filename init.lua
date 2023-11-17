-- Been adjusted from TJ's config
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })

    print("You probably most likely need to restart nvim now")
    return true
end
vim.opt.runtimepath:prepend(lazypath)

require("globals")
require("options")
require("keymaps")
require("plugin-manager")
vim.cmd.colorscheme("contra")
