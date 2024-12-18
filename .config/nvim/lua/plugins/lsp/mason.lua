return {
	"williamboman/mason.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason-lspconfig.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("configs.maps").lsp()
		local ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		}
		require("mason").setup({ ui = ui })
		require("mason-lspconfig").setup()
		local icons = require("lspkind").symbol_map
		local symbols = {
			Error = icons.Error,
			Info = icons.Info,
			Hint = icons.Hint,
			Warn = icons.Warn,
		}

		require("vim").diagnostic.config({
			virtual_text = {
				prefix = " ●",
			},
			signs = true,
			underline = true,
			update_in_insert = false,
		})

		local lspserver = require("vim").lsp

		lspserver.handlers["textDocument/hover"] = lspserver.with(lspserver.handlers.hover, {
			border = "single",
		})
		lspserver.handlers["textDocument/signatureHelp"] = lspserver.with(lspserver.handlers.signature_help, {
			border = "single",
		})

		require("vim").notify = function(msg, log_level)
			if msg:match("exit code") then
				return
			end
			if log_level == require("vim").log.levels.ERROR then
				require("vim").api.nvim_err_writeln(msg)
			else
				require("vim").api.nvim_echo({ { msg } }, true, {})
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
			documentSymbolProvider = true,
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

		require("vim").o.updatetime = 750
		require("vim").cmd(
			[[autocmd CursorHold * lua require("vim").diagnostic.open_float(nil, { focusable = false })]]
		)

		for name, icon in pairs(symbols) do
			local hl = "DiagnosticSign" .. name
			require("vim").fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
		end

		local mason_lsp = require("mason-lspconfig")
		local lsp_cfg = require("lspconfig")

		local server_configs = {
			["clangd"] = {
				InlayHints = {
					Enabled = true,
					ParameterNames = true,
					DeducedTypes = true,
				},
			},
			["rust-analyzer"] = {
				imports = {
					granularity = {
						group = "module",
					},
					prefix = "self",
				},
				cargo = {
					buildScripts = {
						enable = true,
					},
					allFeatures = true,
				},
				procMacro = {
					enable = true,
				},
				inlayHints = {
					enabled = true,
					typeHints = {
						enable = true,
					},
				},
			},
			["sumneko_lua"] = {
				Lua = {
					hint = {
						enable = true,
					},
				},
			},
			["hls"] = {},
		}

		mason_lsp.setup_handlers({
			function(svr)
				lsp_cfg[svr].setup({
					capabilities = capabilities,
					settings = server_configs[svr] or {},
				})
			end,
		})
	end,
}
