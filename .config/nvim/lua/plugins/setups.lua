local M = {}

M.mason = function()
	require("mason").setup()
	require("mason-lspconfig").setup()
end

M.formatter = function()
	require("formatter").setup({
		filetype = require("configs.lsp").formatters,
	})
	vim.cmd([[
    augroup FormatAutogroup
      autocmd!
      autocmd BufWritePost * FormatWrite
    augroup END
    ]])
end

M.statusline = function()
	local options = { theme = "tokyonight" }
	require("lualine").setup(options)
end

return M
