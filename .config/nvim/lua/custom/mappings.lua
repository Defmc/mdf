local M = {}

M.apply = function()
	local map = require("core.utils").map

	map("n", "Q", ":bd <CR>")
	map("n", "<C-S-Up>", ":m-2 <CR>")
	map("n", "<C-S-Down>", ":m+1 <CR>")
	map("n", "<A-Left>", ":vertical resize +5 <CR>")
	map("n", "<A-Right>", ":vertical resize -5 <CR>")
	map("n", "gD", "<cmd>lua vim.lsp.buf.declaration() <CR>")
	map("n", "gd", "<cmd>lua vim.lsp.buf.definition() <CR>")
	map("n", "K", "<cmd>lua vim.lsp.buf.hover() <CR>")
	map("t", "<esc>", "<C-\\><C-n>")
	map("n", "E", ":NvimTreeToggle <CR>")
	map("n", "<A-w>", ":execute 'terminal' | let b:term_type = 'wind' | startinsert <CR>")
end

return M
