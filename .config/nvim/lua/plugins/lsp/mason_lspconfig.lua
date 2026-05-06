return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig"
    },
    lazy = false,
    keys = {
        { "<leader>ca", function() vim.lsp.buf.code_action() end,                                                               desc = "Show code actions" },
        { "<leader>R",  function() vim.lsp.buf.rename() end,                                                                    desc = "Rename variable" },
        { "K",          function() vim.lsp.buf.hover({ border = require("configs.theme").border("FloatBorder") }) end,          desc = "Hover" },
        { "<leader>s",  function() vim.lsp.buf.signature_help({ border = require("configs.theme").border("FloatBorder") }) end, desc = "Signature help" },
    },
    config = function()
        local icons = require("configs.theme").icons

        vim.diagnostic.config {
            underline = true,
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
                border = require("configs.theme").border("DiagnosticBorder")
            }
        }

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
                navic.attach(client, bufnr)
            else
                print("no support founded for nvim-navic")
            end
        end

        vim.lsp.config("*", {
            on_attach = on_attach
        })
        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        globals = { 'vim', 'require' },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })

        require("mason-lspconfig").setup()
    end,
}
