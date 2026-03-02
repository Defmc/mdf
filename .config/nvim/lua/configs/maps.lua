local map = require("core.utils").map

local M = {}

M.terminal = function()
    map("", "<A-w>", ":terminal<CR>")
    map("", "<A-v>", ":vsplit | terminal<CR>")
    map("", "<A-s>", ":split | terminal<CR>")
    map("", "<A-f>", [[ :lua require("core.term").toggle_float_term() <CR> ]])
    map("t", "<Tab><Esc>", "<C-\\><C-n>")
end

M.editor = function()
    map("n", "Q", ":bd<CR>")
    map("n", "<A-l>", "<Cmd>bnext<CR>")
    map("n", "<A-h>", "<Cmd>bprevious<CR>")
    map("n", "<C-S-Down>", ":m+1<CR>")
    map("n", "<C-S-Up>", ":m-2<CR>")
    map("v", ">", ":> <CR> | gv")
    map("v", "<", ":< <CR> | gv")
    map("n", "<A-S-l>", ":vertical resize +5 <CR>")
    map("n", "<A-S-h>", ":vertical resize -5 <CR>")
    map("n", "<A-S-k>", ":horizontal resize +5 <CR>")
    map("n", "<A-S-j>", ":horizontal resize -5 <CR>")
end

return M
