local M = {}
M.config = {
	-- renderer to use
	-- possible options are dynamic, eol, virtline and custom
	renderer = "inlay-hints/render/eol",

	hints = {
		parameter = {
			show = true,
			highlight = "Comment",
		},
		type = {
			show = true,
			highlight = "Comment",
		},
	},

	-- Only show inlay hints for the current line
	only_current_line = false,

	eol = {
		-- whether to align to the extreme right or not
		right_align = false,

		-- padding from the right if right_align is true
		right_align_padding = 7,

		parameter = {
			separator = ", ",
			format = function(hints)
				return string.format(" <- %s", hints):gsub(":", "")
			end,
		},

		type = {
			separator = ", ",
			format = function(hints)
				return string.format(" -> %s", hints):gsub(":", "")
			end,
		},
	},
}

M.setup = function()
	require("inlay-hints").setup(M.config)
end

return M
