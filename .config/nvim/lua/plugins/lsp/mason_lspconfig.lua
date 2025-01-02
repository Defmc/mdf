local vim = require("vim")

return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
    },
    keys = {
        { "<leader>ca", vim.lsp.buf.code_action,    desc = "Show code actions" },
        { "<leader>gd", vim.lsp.buf.declaration,    desc = "Goto declaration" },
        { "<leader>gD", vim.lsp.buf.definition,     desc = "Goto definition" },
        { "<leader>R",  vim.lsp.buf.rename,         desc = "Rename" },
        { "<leader>gi", vim.lsp.buf.implementation, desc = "Goto implementation" },
        { "<leader>r",  vim.lsp.buf.references,     desc = "References" },
        { "K",          vim.lsp.buf.hover,          desc = "Hover" }
    },
    after = "williamboman/mason.nvim",
    config = function()
        require("mason-lspconfig").setup()

        local icons = require("configs.theme").icons
        -- local signs = { "Error", "Warn", "Hint", "Info" }
        -- for _, type in pairs(signs) do
        --     local hl = "DiagnosticSign" .. type
        --     require("vim").fn.sign_define(hl, { text = icons[type], texthl = hl, numhl = hl })
        -- end
        for _, diag in ipairs({ "Error", "Warn", "Info", "Hint" }) do
            vim.fn.sign_define("DiagnosticSign" .. diag, {
                text = "",
                texthl = "DiagnosticSign" .. diag,
                linehl = "",
                numhl = "DiagnosticVirtualText" .. diag,
            })
        end

        local border = "single"

        vim.o.updatetime = 1000
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
            callback = function()
                vim.diagnostic.open_float(nil, { focus = false })
            end,
        })

        require("mason-lspconfig").setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({})
                vim.lsp.inlay_hint.enable(true)
            end,
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
                border = { border }
            }
        })

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
            vim.lsp.handlers.hover, {
                border = border
            }
        )

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
            vim.lsp.handlers.signature_help, {
                border = border
            }
        )
    end,
}
