local settings = {
	header = {
		type = "text",
		align = "center",
		fold_section = false,
		title = "Header",
		margin = 5,
		content = {
			"⠀⠀⠀  ⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀  ⠀⠀",
			"⠀⠀⠀  ⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀ ⠀ ⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀  ⢀⣾⣿⣿⣿⣇⠀⠀  ⠀⠀",
			"⠀⠀⠀ ⠀⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀⠀",
			"⠀⠀⠀ ⠀⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀⠀",
			"⠀⠀ ⠀⠀⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆⠀",
			"⠀⠀  ⠀⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛⠀",
		}, --require("startup.headers").hydra_header,
		highlight = "Statement",
		default_color = "",
		oldfiles_amount = 0,
	},
	header_2 = {
		type = "text",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Quote",
		margin = 5,
		content = require("startup.functions").quote(),
		highlight = "Constant",
		default_color = "",
		oldfiles_amount = 0,
	},
	clock = {
		type = "text",
		content = function()
			local clock = " " .. os.date("%H:%M")
			local date = " " .. os.date("%d-%m-%y")
			return { clock, date }
		end,
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "",
		margin = 5,
		highlight = "TSString",
		default_color = "#FFFFFF",
		oldfiles_amount = 0,
	},
	options = {
		after = function() end,
		mapping_keys = false,
		cursor_column = 0.5,
		empty_lines_between_mappings = true,
		disable_statuslines = true,
		paddings = { 2, 2, 2 },
	},
	colors = {
		background = "#1f2227",
		folded_section = "#56b6c2",
	},
	parts = {
		"header",
		"header_2",
		"clock",
	},
}

return settings
