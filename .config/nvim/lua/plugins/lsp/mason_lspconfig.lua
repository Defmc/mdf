return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
    },
    after = "williamboman/mason.nvim",
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()

        local icons = require("lspkind").symbol_map
        -- local signs = { "Error", "Warn", "Hint", "Info" }
        -- for _, type in pairs(signs) do
        --     local hl = "DiagnosticSign" .. type
        --     require("vim").fn.sign_define(hl, { text = icons[type], texthl = hl, numhl = hl })
        -- end
        for _, diag in ipairs({ "Error", "Warn", "Info", "Hint" }) do
            require("vim").fn.sign_define("DiagnosticSign" .. diag, {
                text = "",
                texthl = "DiagnosticSign" .. diag,
                linehl = "",
                numhl = "DiagnosticVirtualText" .. diag,
            })
        end

        require("vim").diagnostic.config({
            virtual_text = {
                prefix = function(diagnostic)
                    if diagnostic.severity == require("vim").diagnostic.severity.ERROR then
                        return icons.Error
                    elseif diagnostic.severity == require("vim").diagnostic.severity.WARN then
                        return icons.Warn
                    elseif diagnostic.severity == require("vim").diagnostic.severity.INFO then
                        return icons.Info
                    else
                        return icons.Hint
                    end
                end
            }
        })

        require("mason-lspconfig").setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({})
                require("vim").lsp.inlay_hint.enable(true)
            end,
        })
    end,
}
