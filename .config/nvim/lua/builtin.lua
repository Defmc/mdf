local builtin_cfgs = {}

function builtin_cfgs.setup()
    vim.o.tabstop = 8
    vim.o.shiftwidth = 4
    vim.o.softtabstop = 0
    vim.o.number = true
    vim.o.ttyfast = true
    vim.o.smarttab = true
    vim.o.expandtab = true
    vim.o.lazyredraw = true
    vim.o.swapfile = false
    vim.o.shortmess = vim.o.shortmess .. "c"
    vim.o.completeopt = "menuone,noinsert,noselect"
    vim.o.signcolumn = "yes"
end

return builtin_cfgs
