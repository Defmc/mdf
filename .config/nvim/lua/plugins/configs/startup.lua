local opts = {
  theme = "evil",
  options = {
      mapping_keys = false, -- display mapping (e.g. <leader>ff)

      -- if < 0 fraction of screen width
      -- if > 0 numbers of column
      cursor_column = 0.5,

      after = function() -- function that gets executed at the end
      end,
      empty_lines_between_mappings = false, -- add an empty line between mapping/commands
      disable_statuslines = true, -- disable status-, buffer- and tablines
      paddings = {1,2}, -- amount of empty lines before each section (must be equal to amount of sections)
  },
  mappings = {},
  colors = {
    background = "#1f2227",
    folded_section = "#56b6c2", -- the color of folded sections
  }
}

require("startup").setup(opts)
