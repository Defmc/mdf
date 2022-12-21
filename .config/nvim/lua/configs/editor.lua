require("vim").g.mapleader = " "
local maps = require("configs.maps")

maps.editor()
maps.terminal()

require("vim").o.number = true
require("vim").o.tabstop = 4
require("vim").o.softtabstop = 4
require("vim").o.shiftwidth = 4
require("vim").o.expandtab = true
require("vim").o.clipboard = "unnamedplus"
require("vim").o.scrolloff = 4
require("vim").o.incsearch = true

require("configs.theme").setup()
