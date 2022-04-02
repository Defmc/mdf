local M = {}

M.setup = function()
   local map = require("core.utils").map

   map("t", "<esc>", "<C-\\><C-n>")
   map("n", "Q", ":bd<CR>")
   map("n", "<C-S-Up>", ":m-2<CR>")
   map("n", "<C-S-Down>", ":m+1<CR>")
   map("n", "<A-Left>", ":vertical resize -5<CR>")
   map("n", "<A-Right>", ":vertical resize +5<CR>")
   map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
   map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
   map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
end

return M
