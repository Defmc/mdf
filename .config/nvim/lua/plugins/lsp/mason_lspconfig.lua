local vim = require("vim")

return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig"
    },
    lazy = false,
    after = "williamboman/mason.nvim",
    keys = {
        { "<leader>gi", vim.lsp.buf.implementation,                           desc = "Goto implementation" },
        { "<leader>gd", vim.lsp.buf.declaration,                              desc = "Goto declaration" },
        { "<leader>gD", vim.lsp.buf.definition,                               desc = "Goto definition" },
        { "<leader>gT", vim.lsp.buf.type_definition,                          desc = "Goto type definition" },
        { "<leader>ca", vim.lsp.buf.code_action,                              desc = "Show code actions" },
        { "<leader>R",  vim.lsp.buf.rename,                                   desc = "Rename variable" },
        { "<leader>r",  vim.lsp.buf.references,                               desc = "References" },
        { "K",          vim.lsp.buf.hover,                                    desc = "Hover" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
        { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    },
    config = function()
        local icons = require("configs.theme").icons

        require("vim").diagnostic.config {
            underline = true,
            virtual_text = {
                prefix = "",
                severity = nil,
                source = "if_many",
                format = nil,
            },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = icons["Error"],
                    [vim.diagnostic.severity.WARN] = icons["Warn"],
                    [vim.diagnostic.severity.INFO] = icons["Info"],
                    [vim.diagnostic.severity.HINT] = icons["Hint"]
                }
            },
            severity_sort = true,
            update_in_insert = false,
        }

        local border = require("configs.theme").borderty

        vim.o.updatetime = 1000
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
            callback = function()
                vim.diagnostic.open_float(nil, { focus = false })
            end,
        })

        vim.lsp.inlay_hint.enable(true)

        local navic = require("nvim-navic")
        local on_attach = function(client, bufnr)
            if client.server_capabilities.documentSymbolProvider then
                print("attaching nvim-navic")
                navic.attach(client, bufnr)
            else
                print("no support founded for nvim-navic")
            end
        end

        vim.lsp.config("*", {
            on_attach = on_attach
        })

        vim.diagnostic.config({
            virtual_text = {
                prefix = function(diagnostic)
                    if diagnostic.severity == vim.diagnostic.severity.ERROR then
                        return icons.Error
                    elseif diagnostic.severity == vim.diagnostic.severity.WARN then
                        return icons.Warn
                    elseif diagnostic.severity == vim.diagnostic.severity.INFO then
                        return icons.Info
                    else
                        return icons.Hint
                    end
                end,
            },
            float = {
                border = border
            }
        })

        vim.lsp.config('*', {
            handlers = {
                ['textDocument/hover'] = function(err, result, ctx, config)
                    config = config or {}
                    config.border = border
                    vim.lsp.handlers.hover(err, result, ctx, config)
                end,
                ['textDocument/signatureHelp'] = function(err, result, ctx, config)
                    config = config or {}
                    config.border = border
                    vim.lsp.handlers.signature_help(err, result, ctx, config)
                end,
            }
        })

        require("mason-lspconfig").setup()
    end,
}
