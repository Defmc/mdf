local M = {}
local lspactions = require("lspactions")
local opts = {}

M.setup = function()
	local map = require("core.utils").map
	local handlers = vim.lsp.handlers

	vim.ui.select = lspactions.select

	map("n", "<leader>R", [[ :lua require'lspactions'.rename()<CR> ]])

	handlers["textDocument/codeAction"] = lspactions.codeaction
	map("n", "<leader>c", [[ :lua require'lspactions'.code_action()<CR> ]])
	map("n", "<leader>C", [[ :lua require'lspactions'.range_code_action()<CR> ]])

	handlers["textDocument/references"] = lspactions.references
	map("n", "<leader>r", [[ :lua vim.lsp.buf.references()<CR> ]])

	handlers["textDocument/definition"] = lspactions.definition
	map("n", "<leader>d", [[ :lua vim.lsp.buf.definition()<CR> ]])

	handlers["textDocument/declaration"] = lspactions.declaration
	map("n", "<leader>D", [[ :lua vim.lsp.buf.declaration()<CR> ]])

	handlers["textDocument/implementation"] = lspactions.implementation
	map("n", "<leader>I", [[ :lua vim.lsp.buf.implementation()<CR> ]])
end

return M
