local map = require("core.utils").map

local M = {}

M.lsp = function()
	map("n", "<leader>ca", ":lua vim.lsp.buf.code_action() <CR>")
	map("n", "<leader>d", ":lua vim.lsp.buf.declaration() <CR>")
	map("n", "<leader>D", ":lua vim.lsp.buf.definition() <CR>")
	map("n", "<leader>R", ":lua vim.lsp.buf.rename() <CR>")
	map("n", "<leader>i", ":lua vim.lsp.buf.implementation() <CR>")
	map("n", "<leader>r", ":lua vim.lsp.buf.references() <CR>")
	map("n", "K", ":lua vim.lsp.buf.hover() <CR>")
end

M.telescope = function()
	map("n", "ff", ":Telescope find_files <CR>")
	map("n", "fg", ":Telescope live_grep <CR>")
	map("n", "fb", ":Telescope buffers <CR>")
	map("n", "fh", ":Telescope help_tags <CR>")
	map("n", "fc", ":Telescope colorscheme <CR>")
	map("n", "ft", ":Telescope treesitter <CR>")
end

M.terminal = function()
	map("", "<A-w>", ":terminal<CR>")
	map("t", "<Tab><Esc>", "<C-\\><C-n>")
end

M.editor = function()
	map("n", "Q", ":bd<CR>")
	map("n", "<C-S-Down>", ":m+1<CR>")
	map("n", "<C-S-Up>", ":m-2<CR>")
	map("n", "<A-Left>", ":vertical resize +5 <CR>")
	map("n", "<A-Right>", ":vertical resize -5 <CR>")
	map("n", "<Tab>", ":BufferLineCycleNext <CR>")
	map("n", "<S-Tab>", ":BufferLineCyclePrev <CR>")
end

M.nvim_tree = function()
	map("n", "E", ":NvimTreeToggle<CR>")
end

return M