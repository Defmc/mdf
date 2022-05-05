local opts = {
   tools = {
      autoSetHints = true,
      hover_with_actions = true,
      runnables = {
         use_telescope = true,
      },

      inlay_hints = {
         show_parameter_hints = true,
         parameter_hints_prefix = "<- ",
         other_hints_prefix = "=> ",
         max_len_align = false,
         max_len_align_padding = 1,
         right_align = false,
         right_align_padding = 7,
      },

      hover_actions = {
         border = {
            { "╭", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╮", "FloatBorder" },
            { "│", "FloatBorder" },
            { "╯", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╰", "FloatBorder" },
            { "│", "FloatBorder" },
         },
      },
   },

   server = {
      cmd = { "rust-analyzer" },
      filetypes = { "rust" },
      root_dir = require("lspconfig.util").root_pattern("Cargo.toml", "rust-project.json"),
      settings = {
         ["rust-analyzer"] = {
            checkOnSave = {
               allFeatures = true,
               overrideCommand = {},
            },
         },
      },
   },
}

vim.cmd [[autocmd BufWrite * :lua vim.lsp.buf.formatting_sync(nil, 1000) ]]

require("rust-tools").setup(opts)
