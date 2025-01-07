return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
        win = { border = "single" },
        keys = {
          scroll_down = "<C-d>", -- binding to scroll down inside the popup
          scroll_up = "<C-u>", -- binding to scroll up inside the popup
        },
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	}
}
