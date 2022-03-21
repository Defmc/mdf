local M = {}
local map = require ("core.utils").map

map("n", "Q", ":bd<CR>")
map("n", "<C-S-Up>", ":m-2<CR>")
map("n", "<C-S-Down>", ":m+1<CR>")
map("n", "<A-Left>", ":vertical resize -5<CR>")
map("n", "<A-Right>", ":vertical resize +5<CR>")
map("t", "<esc>", "<C-\\><C-n>")
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")

M.ui = {
  theme = "tokyonight",
  italic_comments = true
}

M.plugins = {
  install = require "custom.plugins",
  status = {
    colorizer = true
  },
  options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
}

return M
