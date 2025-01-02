local map = require("core.utils").map

local M = {}

M.terminal = function()
    map("", "<A-w>", ":terminal <CR>")
    map("", "<A-v>", ":vsplit | terminal <CR>")
    map("", "<A-h>", ":split | terminal <CR>")
    map("", "<A-f>", [[ :lua require("core.term").toggle_float_term() <CR> ]])
    map("t", "<Tab><Esc>", "<C-\\><C-n>")
end

M.editor = function()
    map("n", "Q", ":bd<CR>")
    map("n", "<C-S-Down>", ":m+1<CR>")
    map("n", "<C-S-Up>", ":m-2<CR>")
    map("v", ">", ":> <CR> | gv")
    map("v", "<", ":< <CR> | gv")
    map("n", "<A-Right>", ":vertical resize +5 <CR>")
    map("n", "<A-Left>", ":vertical resize -5 <CR>")
    map("n", "<Tab>", ":BufferLineCycleNext <CR>")
    map("n", "<S-Tab>", ":BufferLineCyclePrev <CR>")
end

return M
