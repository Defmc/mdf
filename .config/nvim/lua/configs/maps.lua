local map = require("core.utils").map

local M = {}

M.lsp = function()
	map("n", "gD", "<cmd>lua vim.lsp.buf.declaration() <CR>")
	map("n", "gd", "<cmd>lua vim.lsp.buf.definition() <CR>")
	map("n", "K", "<cmd>lua vim.lsp.buf.hover() <CR>")
end

M.telescope = function()
	map("n", "ff", "<cmd>Telescope find_files <CR>")
	map("n", "fg", "<cmd>Telescope live_grep <CR>")
	map("n", "fb", "<cmd>Telescope buffers <CR>")
	map("n", "fh", "<cmd>Telescope help_tags <CR>")
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
	map("n", "<Tab>", ":bnext<CR>")
	map("n", "<S-Tab>", ":bprev<CR>")
end

M.nvim_tree = function()
	map("n", "E", ":NvimTreeToggle<CR>")
end

return M
