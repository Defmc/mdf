local line_indent = {}

function line_indent.setup()
    vim.opt.list = true
    vim.opt.listchars:append("space:⋅")
    vim.opt.listchars:append("eol:↴")

    require("indent_blankline").setup {
        space_char_blankline = "."
    }
end

return line_indent
