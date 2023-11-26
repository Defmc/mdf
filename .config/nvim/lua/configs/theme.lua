local present, _ = pcall(require, "tokyonight")
local M = {}

if not present then
	M.setup = function() end
	return M
end

M.current_theme = "gruvbox"

-- git = { change = "#6183bb", add = "#449dab", delete = "#914c54" },
-- gitSigns = {
--   add = "#266d6a",
--   change = "#536c9e",
--   delete = "#b2555b",
-- },

M.setup = function()
	-- require("vim").cmd([[colorscheme tokyonight-night]])
	require("vim").cmd([[ set cursorline ]])
	require("vim").o.background = "dark"
	require("vim").cmd([[colorscheme gruvbox]])
	require("configs.theme_utils").load(M.options, M.get_current_colorscheme())
	--	require("configs.theme_set").set_theme(M.themes[M.current_theme])
end

M.themes = {
	gruvbox = {
		none = "NONE",
		fg = "#D5C4A1",
		bg = "#1D2021",
		highlight = "#3A3F4B",
		color = "#D5C4A1",
		black = "#1D2021",
		light_black = "#665C54",
		light_red = "#FB4934",
		red = "#FB4934",
		green = "#B8BB26",
		light_green = "#B8BB26",
		yellow = "#FABD2F",
		light_yellow = "#FABD2F",
		blue = "#83A598",
		light_blue = "#83A598",
		magenta = "#D3869B",
		light_magenta = "#D3869B",
		cyan = "#8EC07C",
		light_cyan = "#8EC07C",
		white = "#D5C4A1",
		light_white = "#FBF1C7",
	},
	folke_tokyo = {
		none = "NONE",
		bg_dark = "#1e2030", --
		bg = "#222436", --
		bg_highlight = "#2f334d", --
		terminal_black = "#444a73", --
		fg = "#c8d3f5", --
		fg_dark = "#828bb8", --
		fg_gutter = "#3b4261",
		dark3 = "#545c7e",
		comment = "#7a88cf", --
		dark5 = "#737aa2",
		blue0 = "#3e68d7", --
		blue = "#82aaff", --
		cyan = "#86e1fc", --
		blue1 = "#65bcff", --
		blue2 = "#0db9d7",
		blue5 = "#89ddff",
		blue6 = "#b4f9f8", --
		blue7 = "#394b70",
		purple = "#fca7ea", --
		magenta2 = "#ff007c",
		magenta = "#c099ff", --
		orange = "#ff966c", --
		yellow = "#ffc777", --
		green = "#c3e88d", --
		green1 = "#4fd6be", --
		green2 = "#41a6b5",
		teal = "#4fd6be", --
		red = "#ff757f", --
		red1 = "#c53b53", --
	},
	tokyonight = {
		none = "NONE",
		fg = "#A9B1D6",
		bg = "#1A1B26",
		cursor = "#A9B1D6",
		highlight = "#3A3F4B",
		black = "#1A1B26",
		light_black = "#4E5173",
		red = "#F7768E",
		light_red = "#E06C75",
		green = "#9ECE6A",
		light_green = "#98C379",
		yellow = "#E0AF68",
		light_yellow = "#D19A66",
		blue = "#7AA2F7",
		light_blue = "#61AFEF",
		magenta = "#9A7ECC",
		light_magenta = "#C678DD",
		cyan = "#4ABAAF",
		light_cyan = "#56B6C2",
		white = "#ACB0D0",
		light_white = "#ABB2BF",
	},
}

M.options = {
	style = "storm", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
	light_style = "day", -- The theme is used when the background is set to light
	transparent = false, -- Enable this to disable setting the background color
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	styles = {
		-- Style to be applied to different syntax groups
		-- Value is any valid attr-list value for `:help nvim_set_hl`
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "dark", -- style for sidebars, see below
		floats = "dark", -- style for floating windows
	},
	sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
	day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
	hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
	dim_inactive = false, -- dims inactive windows
	lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

	--- You can override specific color groups to use other groups or a hex color
	--- function will be called with a ColorScheme table
	on_colors = function(colors) end,

	--- You can override specific highlights to use other groups or a hex color
	--- function will be called with a Highlights and ColorScheme table
	on_highlights = function(highlights, colors) end,
	use_background = true, -- can be light/dark/auto. When auto, background will be set to vim.o.background
}

M.get_current_colorscheme = function()
	return M.themes[M.current_theme]
end

M.icons = {
	File = "",
	Namespace = "󰏖",
	Package = "",
	Method = "󰊕",
	Constructor = "",
	Function = "󰡱",
	Constant = "󰏿",
	String = "󰀬",
	Number = "󰎠",
	Boolean = "◩",
	Array = "󰅪",
	Object = "󰅩",
	Key = "󰷖",
	Null = "󰟢",
	EnumMember = "",
	TypeParameter = "",
	Text = "󰉿",
	Field = "",
	Variable = "󰀫",
	Class = "󰠲",
	Interface = "󱦜",
	Module = "",
	Property = "󰓼",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "󰸌",
	Reference = "󰈇",
	Folder = "",
	Struct = "󰙅",
	Event = "",
	Operator = "󰆕",
	Error = "",
	Warn = " ",
	Info = "",
	Hint = "",
	Added = "",
	Modified = "",
	Removed = "",
}

return M
