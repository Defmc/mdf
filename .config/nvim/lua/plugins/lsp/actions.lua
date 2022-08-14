local M = {}

M.setup = function()
	local lspactions = require("lspactions")

	vim.ui.select = lspactions.select
	vim.ui.input = lspactions.input

	vim.lsp.handlers["textDocument/references"] = lspactions.references
	vim.lsp.handlers["textDocument/definition"] = lspactions.definition
	vim.lsp.handlers["textDocument/declaration"] = lspactions.declaration
	vim.lsp.handlers["textDocument/codeAction"] = function()
		vim.cmd("CodeActionMenu")
	end
	vim.lsp.handlers["textDocument/implementation"] = lspactions.implementation
end

return M
