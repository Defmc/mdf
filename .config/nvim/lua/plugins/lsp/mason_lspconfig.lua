return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig"
    },
    lazy = false,
    keys = {
        { "<leader>gi", function() vim.lsp.buf.implementation() end,                                                            desc = "Goto implementation" },
        { "<leader>gd", function() vim.lsp.buf.declaration() end,                                                               desc = "Goto declaration" },
        { "<leader>gD", function() vim.lsp.buf.definition() end,                                                                desc = "Goto definition" },
        { "<leader>gT", function() vim.lsp.buf.type_definition() end,                                                           desc = "Goto type definition" },
        { "<leader>ca", function() vim.lsp.buf.code_action() end,                                                               desc = "Show code actions" },
        { "<leader>R",  function() vim.lsp.buf.rename() end,                                                                    desc = "Rename variable" },
        { "<leader>r",  function() vim.lsp.buf.references() end,                                                                desc = "References" },
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
        vim.lsp.config('rust_analyzer', {
            settings = {
                ['rust-analyzer'] = {
                    checkOnSave = false,
                }
            }
        })
        vim.lsp.config('clangd', {
            cmd = {
                'clangd',
                '--background-index=false',
                '--j=2',
            }
        })

        require("mason-lspconfig").setup()
    end,
}
