local settings = {
	header = {
		type = "text",
		align = "center",
		fold_section = false,
		title = "Header",
		margin = 5,
		content = function()
			local check_day = function(line, day)
				local out = " "
				for i = 1, 20, 3 do
					local unit = (line:sub(i, i) or "") .. (line:sub(i + 1, i + 1) or "")
					if unit == day then
						out = out .. " x "
					else
						out = out .. unit .. " "
					end
				end
				return out
			end

			local raw_cal = require("core.utils").os_capture("cal")
			local cal_lines = require("core.utils").lines(raw_cal)
			local day = tostring(os.date("%d"))
			if day:sub(1, 1) == "0" then
				day = " " .. day:sub(2, 2)
			end
			return {
				"⠀ ⣶⣶⣶⣶⡆⠀⠀⠀⠀             " .. cal_lines[1],
				"⠀ ⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀  ⠀        " .. cal_lines[2],
				" ⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀         " .. check_day(cal_lines[3], day),
				"⠀⠀  ⢀⣾⣿⣿⣿⣇⠀⠀  ⠀         " .. check_day(cal_lines[4], day),
				"⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀         " .. check_day(cal_lines[5], day),
				"⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀         " .. check_day(cal_lines[6], day),
				"⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆         " .. check_day(cal_lines[7], day),
				"⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛         " .. check_day(cal_lines[8], day),
			}
		end, --require("startup.headers").hydra_header,
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
