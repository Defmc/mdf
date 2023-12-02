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

M.statusline = function()
	require("lualine").setup()
end

M.conform = function()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "ypaf", "isort" },
			-- Use a sub-list to run only the first available formatter
			javascript = { { "prettierd", "prettier" } },
			rust = { "rustfmt" },
			haskell = { "ormolu" },
			bash = { "shfmt" },
		},
		format_after_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters = {
			ormolu = {
				-- This can be a string or a function that returns a string
				command = "ormolu",
				-- OPTIONAL - all fields below this are optional
				-- A list of strings, or a function that returns a list of strings
				-- Return a single string instead to run the command in a shell
				args = { "$FILENAME" },
				-- If the formatter supports range formatting, create the range arguments here
				-- range_args = function(ctx)
				-- 	return { "--line-start", ctx.range.start[1], "--line-end", ctx.range["end"][1] }
				-- end,
				-- Send file contents to stdin, read new contents from stdout (default true)
				-- When false, will create a temp file (will appear in "$FILENAME" args). The temp
				-- file is assumed to be modified in-place by the format command.
				stdin = true,
				-- A function that calculates the directory to run the command in
				-- cwd = require("conform.util").root_file({ ".editorconfig", "package.json" }),
				-- When cwd is not found, don't run the formatter (default false)
				-- require_cwd = false,
				-- When returns false, the formatter will not be used
				-- condition = function(ctx)
				-- 	return vim.fs.basename(ctx.filename) ~= "README.md"
				-- end,
				-- Exit codes that indicate success (default {0})
				exit_codes = { 0 },
				-- Environment variables. This can also be a function that returns a table.
				-- env = {},
			},
			shfmt = {
				command = "shfmt",
				args = { "$FILENAME" },
				stdin = true,
				exit_codes = { 0 },
				-- env = {},
			},
		},
	})
end

M.lspkind = function()
	require("lspkind").init({
		symbol_map = require("configs.theme").icons,
	})
end

return M
