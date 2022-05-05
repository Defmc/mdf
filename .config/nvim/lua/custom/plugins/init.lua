return {
   ["nvim-lua/lsp_extensions.nvim"] = {
      after = "nvim-lspconfig",

      config = function()
         require "custom.plugins.lsp_ext"
      end,

      setup = function()
         require("custom.plugins.mappings").lsp_ext()
      end,
   },
   ["simrat39/rust-tools.nvim"] = {
      after = "nvim-lspconfig",

      config = function()
         require "custom.plugins.rs_tools"
      end,
   },

   ["mg979/vim-visual-multi"] = {},

   ["github/copilot.vim"] = {},

   ["startup-nvim/startup.nvim"] = {
      requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
      after = "bufferline.nvim",
      config = function()
         require "custom.plugins.startup"
      end,
   },

   ["hrsh7th/nvim-cmp"] = {
      after = "friendly-snippets",
      config = function()
         require "custom.plugins.cmp"
      end,
   },

   ["akinsho/bufferline.nvim"] = {
      after = "nvim-web-devicons",
      branch = "main",

      setup = function()
         require("core.mappings").bufferline()
      end,

      config = function()
         require "plugins.configs.bufferline"
      end,
   },

   ["NvChad/nvterm"] = {
      config = function()
         require "custom.plugins.nvterm"
      end,
   },

   ["rcarriga/nvim-notify"] = {
     setup = function()
       require "custom.plugins.notify"
     end
   }
}
