return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        local vim = require("vim")
        vim.cmd([[ set cursorline ]])
        vim.o.background = "dark"
        require("gruvbox").setup({
            palette_overrides = {
                dark0 = "#1d2021",
            },
        })
        vim.cmd([[ colorscheme gruvbox ]])
        vim.cmd([[ hi clear SignColumn ]])
        vim.cmd([[ highlight FloatBorder  guibg=none ]])
        vim.cmd([[ highlight NormalFloat  guibg=none ]])
    end,
    opts = ...,
}
