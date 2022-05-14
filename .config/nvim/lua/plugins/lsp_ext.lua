vim.cmd(
	[[autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require('lsp_extensions').inlay_hints{ enabled = {"TypeHint", "ChainingHint", "ParameterHint"}, prefix = " -> " }]]
)
