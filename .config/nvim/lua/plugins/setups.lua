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
		filetype = {
			lua = { require("formatter.filetypes.lua").stylua },
			rust = { require("formatter.filetypes.lua").rustfmt },
			cpp = { require("formatter.filetypes.lua").clangformat },
			c = { require("formatter.filetypes.lua").clangforma },
		},
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
