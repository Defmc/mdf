local maps = require("plugins.maps")
maps.editor()
maps.terminal()

vim.o.number = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.g.tokyonight_style = "night"
vim.cmd([[colorscheme tokyonight]])
vim.o.clipboard = "unnamedplus"
