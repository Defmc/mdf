local map = require("core.utils").map

local M = {}

M.terminal = function()
	map("", "<A-w>", ":terminal<CR>")
	map("t", "<esc>", "<C-\\><C-n>")
end

M.editor = function()
	map("n", "Q", ":bd<CR>")
	map("n", "<C-S-Down>", ":m+1<CR>")
	map("n", "<C-S-Up>", ":m-2<CR>")
	map("n", "<A-Left>", ":vertical resize +5 <CR>")
	map("n", "<A-Right>", ":vertical resize -5 <CR>")
end

M.nvim_tree = function()
	map("n", "E", ":NvimTreeToggle<CR>")
end

return M
