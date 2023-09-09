local M = {}

M.telescope = function()
	require("telescope").setup({
		extensions = {
			["ui-select"] = { require("telescope.themes").get_cursor({}) },
		},
	})
end

M.lsp_inlayhints = function()
	require("lsp-inlayhints").setup({
		inlay_hints = {
			parameter_hints = {
				show = true,
				prefix = "<- ",
				separator = ", ",
				remove_colon_start = false,
				remove_colon_end = true,
			},
			type_hints = {
				-- type and other hints
				show = true,
				prefix = "",
				separator = "",
				remove_colon_start = false,
				remove_colon_end = false,
			},
			only_current_line = false,
			-- separator between types and parameter hints. Note that type hints are
			-- shown before parameter
			labels_separator = "  ",
			-- whether to align to the length of the longest line in the file
			max_len_align = false,
			-- padding from the left if max_len_align is true
			max_len_align_padding = 1,
			-- highlight group
			highlight = "LspInlayHint",
			-- virt_text priority
			priority = 0,
		},
		enabled_at_startup = true,
		debug_mode = false,
	})
end

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
