local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"

  -- lspservers with default config
  local servers = { "rust_analyzer", "clangd" }

  for _, lsp in ipairs(servers) do
     lspconfig[lsp].setup {
        on_attach = attach,
        capabilities = capabilities,
        flags = {
           debounce_text_changes = 150,
        },
     }
  end

  vim.cmd [[ autocmd CursorHold, CursorMoved, InsertLeave, BufEnter, BufWinEnter, TabEnter, BufWritePost * :lua require'lsp_extensions'.inlay_hints{ prefix = '=>', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} } ]]

  vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]]

  require('rust-tools').setup({})
end

return M
