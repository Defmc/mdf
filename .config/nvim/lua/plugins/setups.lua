local M = {}

M.mason = function()
	local ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	}
	require("mason").setup({ ui = ui })
	require("mason-lspconfig").setup()
end

M.formatter = function()
	require("formatter").setup({
		filetype = require("configs.lsp").formatters,
	})
	require("vim").cmd([[
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
