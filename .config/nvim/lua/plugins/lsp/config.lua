local symbols = {
	Error = "",
	Info = "",
	Hint = "",
	Warn = "",
}

vim.diagnostic.config({
	virtual_text = {
		prefix = " ●",
	},
	signs = true,
	underline = true,
	update_in_insert = false,
})

local lspserver = vim.lsp

lspserver.handlers["textDocument/hover"] = lspserver.with(lspserver.handlers.hover, {
	border = "single",
})
lspserver.handlers["textDocument/signatureHelp"] = lspserver.with(lspserver.handlers.signature_help, {
	border = "single",
})

vim.notify = function(msg, log_level)
	if msg:match("exit code") then
		return
	end
	if log_level == vim.log.levels.ERROR then
		vim.api.nvim_err_writeln(msg)
	else
		vim.api.nvim_echo({ { msg } }, true, {})
	end
end

local capabilities = lspserver.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

vim.o.updatetime = 750
vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]])

for name, icon in pairs(symbols) do
	local hl = "DiagnosticSign" .. name
	vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

local servers = require("nvim-lsp-installer").get_installed_servers()
for _, svr in ipairs(servers) do
	require("lspconfig")[svr.name].setup({
		on_attach = function() end,
		capabilities = capabilities,
	})
end
