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

M.mappings = {
   -- terminal related mappings
   terminal = {
      -- multiple mappings can be given for esc_termmode, esc_hide_termmode

      -- get out of terminal mode
      esc_termmode = { "<esc>" },

      -- get out of terminal mode and hide it
      esc_hide_termmode = { "<A-h-i>" },
      -- show & recover hidden terminal buffers in a telescope picker
      pick_term = "<A-s>",

      -- spawn a single terminal and toggle it
      -- this just works like toggleterm kinda
      new_horizontal = "<A-s>h",
      new_vertical = "<A-s>v",
      new_float = "<A-s-w>",

      -- spawn new terminals
      spawn_horizontal = "<A-h>",
      spawn_vertical = "<A-v>",
      spawn_window = "<A-w>",
   },

}

return M
