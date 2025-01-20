return {
    "stevearc/conform.nvim",
    after = {
        "williamboman/mason.nvim",
    },
    opts = {
        format_on_save = {
            lsp_format = "fallback",
            timeout_ms = 500
        }
    }
}
