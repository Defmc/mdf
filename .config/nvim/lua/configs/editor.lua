vim.g.mapleader = " "
local maps = require("configs.maps")
maps.editor()
maps.terminal()

vim.o.number = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.clipboard = "unnamedplus"

require("configs.theme").setup()
