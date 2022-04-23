return {
   numbers = false,
   behavior = {
      close_on_exit = true,
   },
   window = {
      vsplit_ratio = 0.5,
      split_ratio = 0.4,
   },
   location = {
      horizontal = "rightbelow",
      vertical = "rightbelow",
      float = {
         relative = "editor",
         row = 0.3,
         col = 0.25,
         width = 0.5,
         height = 0.4,
         border = "single",
      },
   },
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
}
