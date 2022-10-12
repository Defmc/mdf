local M = {}

M.setup = function()
	local lspactions = require("lspactions")

	require("vim").ui.select = lspactions.select
	require("vim").ui.input = lspactions.input

	require("vim").lsp.handlers["textDocument/references"] = lspactions.references
	require("vim").lsp.handlers["textDocument/definition"] = lspactions.definition
	require("vim").lsp.handlers["textDocument/declaration"] = lspactions.declaration
	require("vim").lsp.handlers["textDocument/codeAction"] = function()
		require("vim").cmd("CodeActionMenu")
	end
	require("vim").lsp.handlers["textDocument/implementation"] = lspactions.implementation
end

return M
