local M = {}

M.setup = function()
  require 'lspconfig'.rust_analyzer.setup {
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
            command = "clippy"
          }
        }
      }
  }
  vim.cmd [[autocmd CursorHold,CursorHoldI *.rs :lua require 'lsp_extensions'.inlay_hints{ prefix = "=> ", highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"}}]]

  vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]]

end

return M
