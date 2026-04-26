local map = require("core.utils").map

local M = {}

M.terminal = function()
    map("t", "<A-Esc>", "<C-\\><C-n>")
end

M.editor = function()
    map("n", "<A-q>", ":bd<CR>")
    map("n", "<A-l>", "<Cmd>bnext<CR>")
    map("n", "<A-h>", "<Cmd>bprevious<CR>")
    map("n", "<C-S-J>", ":m+1<CR>")
    map("n", "<C-S-K>", ":m-2<CR>")
    map("v", ">", ":> <CR> | gv")
    map("v", "<", ":< <CR> | gv")
    map("n", "<A-S-l>", ":vertical resize +5 <CR>")
    map("n", "<A-S-h>", ":vertical resize -5 <CR>")
    map("n", "<A-S-k>", ":horizontal resize +5 <CR>")
    map("n", "<A-S-j>", ":horizontal resize -5 <CR>")
end

return M
