return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        {
            "kdheepak/cmp-latex-symbols",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "onsails/lspkind.nvim",
            "L3MON4D3/LuaSnip",
        },
    },
    config = function()
        local cmp = require("cmp")

        vim.opt.completeopt = "menuone,noselect"

        local border = require("configs.theme").border

        local options = {
            window = {
                completion = {
                    border = border("CmpBorder"),
                    scrollbar = false
                },
                documentation = {
                    border = border("CmpDocBorder"),
                    scrollbar = false
                },
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            formatting = {
                format = require("lspkind").cmp_format({
                    mode = "symbol",       -- show only symbol annotations
                    maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                    ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

                    -- The function below will be called before any actual modifications from lspkind
                    -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                    -- before = function(_entry, vim_item)
                    --     return vim_item
                    -- end,
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
                        require("luasnip").expand_or_jump()
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
                        require("luasnip").jump(-1)
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
                { name = "path" },
                { name = "latex_symbols", options = { strategy = 0 } },
            },
        }

        cmp.setup(options)
    end,
}
