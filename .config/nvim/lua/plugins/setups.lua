local M = {}

M.installer = function()
	require("nvim-lsp-installer").setup({
		automatic_installation = true,
		ui = {
			icons = {
				server_installed = "✓",
				server_pending = "➜",
				server_uninstalled = "✗",
			},
		},
	})
end

M.format = function()
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
