local M = {}

M.bg = "#000000"
M.fg = "#ffffff"
M.day_brightness = 0.3

function M.new_style()
	---@diagnostic disable-next-line: undefined-field
	return require("vim").treesitter.highlighter.hl_map == nil
end

function M.get(group)
	if group:sub(1, 1) ~= "@" or M.new_style() then
		return group
	end

	group = group:sub(2)

	local lang
	while group do
		if M.fallbacks[group] then
			return (lang or "") .. M.fallbacks[group]
		end
		group, lang = group:match("(.*)%.(.*)")
	end
end

-- taken from https://github.com/nvim-treesitter/nvim-treesitter/blob/master/lua/nvim-treesitter/highlight.lua
M.fallbacks = {
	["annotation"] = "TSAnnotation",
	["attribute"] = "TSAttribute",
	["boolean"] = "TSBoolean",
	["character"] = "TSCharacter",
	["character.special"] = "TSCharacterSpecial",
	["comment"] = "TSComment",
	["conditional"] = "TSConditional",
	["constant"] = "TSConstant",
	["constant.builtin"] = "TSConstBuiltin",
	["constant.macro"] = "TSConstMacro",
	["constructor"] = "TSConstructor",
	["debug"] = "TSDebug",
	["define"] = "TSDefine",
	["error"] = "TSError",
	["exception"] = "TSException",
	["field"] = "TSField",
	["float"] = "TSFloat",
	["function"] = "TSFunction",
	["function.call"] = "TSFunctionCall",
	["function.builtin"] = "TSFuncBuiltin",
	["function.macro"] = "TSFuncMacro",
	["include"] = "TSInclude",
	["keyword"] = "TSKeyword",
	["keyword.function"] = "TSKeywordFunction",
	["keyword.operator"] = "TSKeywordOperator",
	["keyword.return"] = "TSKeywordReturn",
	["label"] = "TSLabel",
	["method"] = "TSMethod",
	["method.call"] = "TSMethodCall",
	["namespace"] = "TSNamespace",
	["none"] = "TSNone",
	["number"] = "TSNumber",
	["operator"] = "TSOperator",
	["parameter"] = "TSParameter",
	["parameter.reference"] = "TSParameterReference",
	["preproc"] = "TSPreProc",
	["property"] = "TSProperty",
	["punctuation.delimiter"] = "TSPunctDelimiter",
	["punctuation.bracket"] = "TSPunctBracket",
	["punctuation.special"] = "TSPunctSpecial",
	["repeat"] = "TSRepeat",
	["storageclass"] = "TSStorageClass",
	["string"] = "TSString",
	["string.regex"] = "TSStringRegex",
	["string.escape"] = "TSStringEscape",
	["string.special"] = "TSStringSpecial",
	["symbol"] = "TSSymbol",
	["tag"] = "TSTag",
	["tag.attribute"] = "TSTagAttribute",
	["tag.delimiter"] = "TSTagDelimiter",
	["text"] = "TSText",
	["text.strong"] = "TSStrong",
	["text.emphasis"] = "TSEmphasis",
	["text.underline"] = "TSUnderline",
	["text.strike"] = "TSStrike",
	["text.title"] = "TSTitle",
	["text.literal"] = "TSLiteral",
	["text.uri"] = "TSURI",
	["text.math"] = "TSMath",
	["text.reference"] = "TSTextReference",
	["text.environment"] = "TSEnvironment",
	["text.environment.name"] = "TSEnvironmentName",
	["text.note"] = "TSNote",
	["text.warning"] = "TSWarning",
	["text.danger"] = "TSDanger",
	["text.todo"] = "TSTodo",
	["type"] = "TSType",
	["type.builtin"] = "TSTypeBuiltin",
	["type.qualifier"] = "TSTypeQualifier",
	["type.definition"] = "TSTypeDefinition",
	["variable"] = "TSVariable",
	["variable.builtin"] = "TSVariableBuiltin",
}

M.defaults = {
	["@annotation"] = {
		default = true,
		link = "PreProc",
	},
	["@attribute"] = {
		default = true,
		link = "PreProc",
	},
	["@boolean"] = {
		default = true,
		link = "Boolean",
	},
	["@character"] = {
		default = true,
		link = "Character",
	},
	["@character.special"] = {
		default = true,
		link = "SpecialChar",
	},
	["@comment"] = {
		default = true,
		link = "Comment",
	},
	["@conditional"] = {
		default = true,
		link = "Conditional",
	},
	["@constant"] = {
		default = true,
		link = "Constant",
	},
	["@constant.builtin"] = {
		default = true,
		link = "Special",
	},
	["@constant.macro"] = {
		default = true,
		link = "Define",
	},
	["@constructor"] = {
		default = true,
		link = "Special",
	},
	["@debug"] = {
		default = true,
		link = "Debug",
	},
	["@define"] = {
		default = true,
		link = "Define",
	},
	["@exception"] = {
		default = true,
		link = "Exception",
	},
	["@field"] = {
		default = true,
		link = "Identifier",
	},
	["@float"] = {
		default = true,
		link = "Float",
	},
	["@function"] = {
		default = true,
		link = "Function",
	},
	["@function.builtin"] = {
		default = true,
		link = "Special",
	},
	["@function.call"] = {
		default = true,
		link = "@function",
	},
	["@function.macro"] = {
		default = true,
		link = "Macro",
	},
	["@include"] = {
		default = true,
		link = "Include",
	},
	["@keyword"] = {
		default = true,
		link = "Keyword",
	},
	["@keyword.coroutine"] = {
		default = true,
		link = "@keyword",
	},
	["@keyword.function"] = {
		default = true,
		link = "Keyword",
	},
	["@keyword.operator"] = {
		default = true,
		link = "@operator",
	},
	["@keyword.return"] = {
		default = true,
		link = "@keyword",
	},
	["@label"] = {
		default = true,
		link = "Label",
	},
	["@method"] = {
		default = true,
		link = "Function",
	},
	["@method.call"] = {
		default = true,
		link = "@method",
	},
	["@namespace"] = {
		default = true,
		link = "Include",
	},
	["@none"] = {
		default = true,
	},
	["@number"] = {
		default = true,
		link = "Number",
	},
	["@operator"] = {
		default = true,
		link = "Operator",
	},
	["@parameter"] = {
		default = true,
		link = "Identifier",
	},
	["@preproc"] = {
		default = true,
		link = "PreProc",
	},
	["@property"] = {
		default = true,
		link = "Identifier",
	},
	["@punctuation.bracket"] = {
		default = true,
		link = "Delimiter",
	},
	["@punctuation.delimiter"] = {
		default = true,
		link = "Delimiter",
	},
	["@punctuation.special"] = {
		default = true,
		link = "Delimiter",
	},
	["@repeat"] = {
		default = true,
		link = "Repeat",
	},
	["@storageclass"] = {
		default = true,
		link = "StorageClass",
	},
	["@string"] = {
		default = true,
		link = "String",
	},
	["@string.escape"] = {
		default = true,
		link = "SpecialChar",
	},
	["@string.regex"] = {
		default = true,
		link = "String",
	},
	["@string.special"] = {
		default = true,
		link = "SpecialChar",
	},
	["@symbol"] = {
		default = true,
		link = "Identifier",
	},
	["@tag"] = {
		default = true,
		link = "Label",
	},
	["@tag.attribute"] = {
		default = true,
		link = "@property",
	},
	["@tag.delimiter"] = {
		default = true,
		link = "Delimiter",
	},
	["@text"] = {
		default = true,
		link = "@none",
	},
	["@text.danger"] = {
		default = true,
		link = "WarningMsg",
	},
	["@text.emphasis"] = {
		default = true,
		italic = true,
	},
	["@text.environment"] = {
		default = true,
		link = "Macro",
	},
	["@text.environment.name"] = {
		default = true,
		link = "Type",
	},
	["@text.literal"] = {
		default = true,
		link = "String",
	},
	["@text.math"] = {
		default = true,
		link = "Special",
	},
	["@text.note"] = {
		default = true,
		link = "SpecialComment",
	},
	["@text.reference"] = {
		default = true,
		link = "Constant",
	},
	["@text.strike"] = {
		strikethrough = true,
	},
	["@text.strong"] = {
		bold = true,
		default = true,
	},
	["@text.title"] = {
		default = true,
		link = "Title",
	},
	["@text.underline"] = {
		underline = true,
	},
	["@text.uri"] = {
		default = true,
		link = "Underlined",
	},
	["@text.warning"] = {
		default = true,
		link = "Todo",
	},
	["@text.todo"] = {
		default = true,
		link = "Todo",
	},
	["@type"] = {
		default = true,
		link = "Type",
	},
	["@type.builtin"] = {
		default = true,
		link = "Type",
	},
	["@type.definition"] = {
		default = true,
		link = "Typedef",
	},
	["@type.qualifier"] = {
		default = true,
		link = "@keyword",
	},
	["@variable.builtin"] = {
		default = true,
		link = "Special",
	},
}

local function hexToRgb(c)
	c = string.lower(c)
	return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
end

function M.blend(foreground, background, alpha)
	alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
	local bg = hexToRgb(background)
	local fg = hexToRgb(foreground)

	local blendChannel = function(i)
		local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

function M.darken(hex, amount, bg)
	return M.blend(hex, bg or M.bg, amount)
end

function M.lighten(hex, amount, fg)
	return M.blend(hex, fg or M.fg, amount)
end

function M.invert_color(color)
	local hsluv = require("tokyonight.hsluv")
	if color ~= "NONE" then
		local hsl = hsluv.hex_to_hsluv(color)
		hsl[3] = 100 - hsl[3]
		if hsl[3] < 40 then
			hsl[3] = hsl[3] + (100 - hsl[3]) * M.day_brightness
		end
		return hsluv.hsluv_to_hex(hsl)
	end
	return color
end

function M.highlight(group, hl)
	group = M.get(group)
	if not group then
		return
	end
	if hl.style then
		if type(hl.style) == "table" then
			hl = require("vim").tbl_extend("force", hl, hl.style)
		elseif hl.style:lower() ~= "none" then
			-- handle old string style definitions
			for s in string.gmatch(hl.style, "([^,]+)") do
				hl[s] = true
			end
		end
		hl.style = nil
	end
	require("vim").api.nvim_set_hl(0, group, hl)
end

function M.autocmds(config)
	local vim = require("vim")
	local group = vim.api.nvim_create_augroup("tokyonight", { clear = true })

	vim.api.nvim_create_autocmd("ColorSchemePre", {
		group = group,
		callback = function()
			vim.api.nvim_del_augroup_by_id(group)
		end,
	})
	local function set_whl()
		local win = vim.api.nvim_get_current_win()
		local whl = vim.split(vim.wo[win].winhighlight, ",")
		vim.list_extend(whl, { "Normal:NormalSB", "SignColumn:SignColumnSB" })
		whl = vim.tbl_filter(function(hl)
			return hl ~= ""
		end, whl)
		vim.opt_local.winhighlight = table.concat(whl, ",")
	end

	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		pattern = table.concat(config.sidebars, ","),
		callback = set_whl,
	})
	if vim.tbl_contains(config.sidebars, "terminal") then
		vim.api.nvim_create_autocmd("TermOpen", {
			group = group,
			callback = set_whl,
		})
	end
end

-- Simple string interpolation.
--
-- Example template: "${name} is ${value}"
--
---@param str string template string
---@param table table key value pairs to replace in the string
function M.template(str, table)
	return (
		str:gsub("($%b{})", function(w)
			return require("vim").tbl_get(table, unpack(require("vim").split(w:sub(3, -2), ".", { plain = true }))) or w
		end)
	)
end

function M.syntax(syntax)
	for group, colors in pairs(syntax) do
		M.highlight(group, colors)
	end
end

function M.terminal(colors)
	local vim = require("vim")
	-- dark
	vim.g.terminal_color_0 = colors.black
	vim.g.terminal_color_8 = colors.light_black

	-- light
	vim.g.terminal_color_7 = colors.white
	vim.g.terminal_color_15 = colors.light_white

	-- colors
	vim.g.terminal_color_1 = colors.red
	vim.g.terminal_color_9 = colors.light_red

	vim.g.terminal_color_2 = colors.green
	vim.g.terminal_color_10 = colors.light_green

	vim.g.terminal_color_3 = colors.yellow
	vim.g.terminal_color_11 = colors.light_yellow

	vim.g.terminal_color_4 = colors.blue
	vim.g.terminal_color_12 = colors.light_blue

	vim.g.terminal_color_5 = colors.magenta
	vim.g.terminal_color_13 = colors.light_magenta

	vim.g.terminal_color_6 = colors.cyan
	vim.g.terminal_color_14 = colors.light_cyan
end

function M.invert_colors(colors)
	if type(colors) == "string" then
		---@diagnostic disable-next-line: return-type-mismatch
		return M.invert_color(colors)
	end
	for key, value in pairs(colors) do
		colors[key] = M.invert_colors(value)
	end
	return colors
end

function M.invert_highlights(hls)
	for _, hl in pairs(hls) do
		if hl.fg then
			hl.fg = M.invert_color(hl.fg)
		end
		if hl.bg then
			hl.bg = M.invert_color(hl.bg)
		end
		if hl.sp then
			hl.sp = M.invert_color(hl.sp)
		end
	end
end

function M.load(theme_name, options, colors)
	local vim = require("vim")

	-- only needed to clear when not the default colorscheme
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end
	vim.g.colors_name = theme_name

	local theme = require("configs.theme_hl").setup(options, colors)

	M.syntax(theme.highlights)

	-- if M.new_style() then
	-- 	for group, colors in pairs(M.defaults) do
	-- 		if not theme.highlights[group] then
	-- 			M.highlight(group, colors)
	-- 		end
	-- 	end
	-- end
	--
	-- M.syntax(theme.highlights)
	--
	-- -- vim.api.nvim_set_hl_ns(M.ns)
	-- if theme.config.terminal_colors then
	-- 	M.terminal(theme.colors)
	-- end
	--
	-- M.autocmds(theme.config)
	--
	-- vim.defer_fn(function()
	-- 	M.syntax(theme.defer)
	-- end, 100)
end

return M
