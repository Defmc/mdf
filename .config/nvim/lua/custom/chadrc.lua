local M = {}
require("custom.keymap").setup()

M.ui = {
   theme = "tokyonight",
   italic_comments = true,
}

M.plugins = {
   install = require "custom.plugins",
   status = {
      colorizer = true,
   },
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
   default_plugin_config_replace = {
   },
   default_plugin_remove = { "extensions" },
}

return M
