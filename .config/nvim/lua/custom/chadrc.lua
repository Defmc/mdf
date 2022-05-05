require("custom.mappings").apply()
local M = {}
M.options = {
   path = "", -- path to file that overrides core.options
   -- NvChad options
   nvChad = {
      -- updater
      update_url = "https://github.com/NvChad/NvChad",
      update_branch = "main",
   },
}

M.ui = {
   hl_override = {},
   colors = "", -- path of your file that contains colors
   theme = "tokyonight", -- default theme
   transparency = false,
}

M.plugins = {
   override = {},

   options = {
      packer = {
         init_file = "plugins.packerInit",
      },
      lspconfig = {
         setup_lspconf = "", -- path of lspconfig file
      },
      statusline = {
         style = "round", -- default/round/slant/block/arrow
      },
   },

   -- add, modify, remove plugins
   user = require "custom.plugins",
}

-- non plugin only
M.mappings = {
   misc = nil,
}

return M
