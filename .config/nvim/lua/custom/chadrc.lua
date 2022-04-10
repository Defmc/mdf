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
   default_plugin_config_replace = {},
   default_plugin_remove = { "extensions" },
}

M.mappings = {
   terminal = {
      esc_termmode = { "<esc>" },
      esc_hide_termmode = { "<A-q>" },
      pick_term = "<A>s",

      -- split terminal
      new_horizontal = "<A-s>h",
      new_vertical = "<A-s>v",
      new_float = "<A-f>",

      -- creates new instance
      spawn_horizontal = "<A-h>",
      spawn_vertical = "<A-v>",
      spawn_window = "<A-w>",
   },
}

return M
