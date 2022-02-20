local M = {}
local map = require ("core.utils").map

map("n", "Q", ":bd<CR>")
map("n", "<C-S-Up>", ":m-2<CR>")
map("n", "<C-S-Down>", ":m+1<CR>")
map("n", "<A-Left>", ":vertical resize -5<CR>")
map("n", "<A-Right>", ":vertical resize +5<CR>")
map("t", "<esc>", "<C-\\><C-n>")

M.ui = {
   theme = "tokyonight",
}

M.plugins = {
  install = require "custom.plugins",
  options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
}

require ("custom.plugins.lsp_rust_cfg").setup()

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"
   local servers = { "rustc-analyzer", "clangd" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
      }
   end
end

return M
