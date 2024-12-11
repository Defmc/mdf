return {
	"hrsh7th/nvim-cmp",
	after = "onsails/lspkind.nvim",
	dependencies = {
		{
			"kdheepak/cmp-latex-symbols",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
	},
	config = function()
		local cmp = require("cmp")

		require("vim").opt.completeopt = "menuone,noselect"

		local function border(hl_name)
			return {
				{ "╭", hl_name },
				{ "─", hl_name },
				{ "╮", hl_name },
				{ "│", hl_name },
				{ "╯", hl_name },
				{ "─", hl_name },
				{ "╰", hl_name },
				{ "│", hl_name },
			}
		end

		local cmp_window = require("cmp.utils.window")

		function cmp_window:has_scrollbar()
			return false
		end

		local options = {
			window = {
				completion = {
					border = border("CmpBorder"),
				},
				documentation = {
					border = border("CmpDocBorder"),
				},
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			formatting = {
				format = require("lspkind").cmp_format({
					mode = "symbol", -- show only symbol annotations
					maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
					ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

					-- The function below will be called before any actual modifications from lspkind
					-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
					before = function(entry, vim_item)
						return vim_item
					end,
				}),
			},
			mapping = {
				["<C-Up>"] = cmp.mapping.select_prev_item(),
				["<C-Down>"] = cmp.mapping.select_next_item(),
				["<S-Up>"] = cmp.mapping.scroll_docs(-4),
				["<S-Down>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif require("luasnip").expand_or_jumpable() then
						require("vim").fn.feedkeys(
							require("vim").api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
							""
						)
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif require("luasnip").jumpable(-1) then
						require("vim").fn.feedkeys(
							require("vim").api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true),
							""
						)
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "nvim_lua" },
				{ name = "path" },
				{ name = "copilot" },
				{ name = "latex_symbols", options = { strategy = 0 } },
			},
		}

		cmp.setup(options)
	end,
}
