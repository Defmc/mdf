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
        vim.cmd([[ hi clear SignColumn ]])
        vim.cmd([[ hi FloatBorder  guibg=none ]])
        vim.cmd([[ hi NormalFloat  guibg=none ]])
        vim.cmd([[ hi Pmenu guibg=none ]])
        vim.cmd([[ colorscheme gruvbox ]])
    end,
    opts = ...,
}
