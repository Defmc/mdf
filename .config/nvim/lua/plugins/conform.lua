return {
    "stevearc/conform.nvim",
    after = {

        "williamboman/mason.nvim",
    },
    config = function()
        require("conform").setup({
            format_on_save = {
                lsp_format = "fallback",
                timeout_ms = 500,
            },
        })
    end,
}
