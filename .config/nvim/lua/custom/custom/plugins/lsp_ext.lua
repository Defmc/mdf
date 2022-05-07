vim.cmd [[ autocmd CursorHold, CursorMoved, InsertLeave, BufEnter, BufWinEnter, TabEnter, BufWritePost * :lua require'lsp_extensions'.inlay_hints{ prefix = '=>', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} } ]]

vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]]
