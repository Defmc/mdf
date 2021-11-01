local lsp_cfg = {}

function lsp_cfg.setup()
    require'lspconfig'.rust_analyzer.setup {
      on_attach = on_attach,

      settings = {
        ["rust-analyzer"] = {
          assist = {
            importMergeBehavior = "last",
            importPrefix = "by_self",
          },
          diagnostics = {
            disabled = { "unresolved-import" }
          },
          cargo = {
              loadOutDirsFromCheck = true
          },
          procMacro = {
              enable = true
          },
          checkOnSave = {
              command = "clippy"
          },
        }
      }
    }
end

return lsp_cfg
