local map = require("core.utils").map

local M = {}

M.lsp = function()
	map("n", "gD", "<cmd>lua vim.lsp.buf.declaration() <CR>")
	map("n", "gd", "<cmd>lua vim.lsp.buf.definition() <CR>")
	map("n", "K", "<cmd>lua vim.lsp.buf.hover() <CR>")
end

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
	map("n", "<Tab>", ":bnext")
	map("n", "<S-Tab>", ":bprev")
end

M.nvim_tree = function()
	map("n", "E", ":NvimTreeToggle<CR>")
end

return M