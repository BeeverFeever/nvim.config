vim.loader.enable()


require("globals").lazyload(lazypath)

require("options").opts()
require("keymaps").general()
require("plugins")
