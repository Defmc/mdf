local present, _ = pcall(require, "tokyonight")
local M = {}

if not present then
	M.setup = function() end
	return M
end

M.setup = function()
	vim.cmd([[colorscheme tokyonight-night]])
	vim.cmd([[ set cursorline ]])
end

local theme_colors = require("tokyonight.colors").setup({ style = "night" })

M.colors = {
	bg = theme_colors.bg_statusline,
	fg = theme_colors.fg,
	yellow = theme_colors.yellow,
	cyan = theme_colors.cyan,
	darkblue = theme_colors.blue0,
	green = theme_colors.green,
	orange = theme_colors.orange,
	violet = theme_colors.purple,
	magenta = theme_colors.magenta,
	blue = theme_colors.blue,
	red = theme_colors.red,
	light_bg = theme_colors.bg_highlight,
	primary_blue = theme_colors.blue5,
}

return M
