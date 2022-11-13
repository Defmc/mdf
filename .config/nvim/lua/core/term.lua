M = {}

M.config = {
	-- The command to run as a job, if nil run the 'shell'.
	command = nil, -- string or list of string
	-- The placement in the editor of the floating window.
	layout = "center", -- center | bottom | top | left | right
	-- The width/height of the window. Must be a value between 0.1
	-- and 1, 1 corresponds to 100% of the editor width/height.
	width = 0.8,
	height = 0.8,
	-- Offset in character cells of the window, relative to the
	-- layout.
	row = 0,
	col = 0,
	-- Options passed to nvim_open_win (:h nvim_open_win())
	-- You can use it to customize various things like border etc.
	win_api = { style = "minimal", relative = "editor" },
	-- Terminal buffer name
	name = "fterm",
	-- Terminal highlight group, default NormalFloat
	-- With it you can customize the background and default
	-- foreground color since `{g,b}:terminal_color_x` will be used
	-- as well for foreground, based on ANSI sequences
	-- (see :h terminal TERMINAL COLORS)
	terminal_hl = nil,
	-- Border highlight group, default FloatBorder
	border_hl = "FloatBorder",
	-- `on_exit` a optional function to call when the terminal's job
	-- exits. It will receive the job ID and exit code as argument.
}

M.get_window_layout = function()
	local screen_w = require("vim").opt.columns:get()
	local screen_h = require("vim").opt.lines:get() - require("vim").opt.cmdheight:get()
	local _width = screen_w * M.config.width
	local _height = screen_h * M.config.height
	local width = math.floor(_width)
	local height = math.floor(_height)
	local center_y = (require("vim").opt.lines:get() - _height) / 2
	local center_x = (screen_w - _width) / 2
	local layouts = {
		center = {
			anchor = "NW",
			row = center_y + M.config.row,
			col = center_x + M.config.col,
			width = width,
			height = height,
		},
		bottom = {
			anchor = "SW",
			row = screen_h - M.config.row,
			col = center_x + M.config.col,
			width = width,
			height = height,
		},
		top = {
			anchor = "NW",
			row = 0 + M.config.row,
			col = center_x + M.config.col,
			width = width,
			height = height,
		},
		left = {
			anchor = "NW",
			row = center_y + M.config.row,
			col = 0 + M.config.col,
			width = width,
			height = height,
		},
		right = {
			anchor = "NE",
			row = center_y + M.config.row,
			col = screen_w - M.config.col,
			width = width,
			height = height,
		},
	}
	return layouts[M.config.layout]
end

M.float_term = function(cmd)
	local buffer = require("vim").api.nvim_create_buf(true, false)
	local win_opts = require("vim").tbl_deep_extend("force", M.get_window_layout(), M.config.win_api)

	require("vim").api.nvim_open_win(buffer, true, win_opts)
	local job = require("vim").fn.jobstart(cmd, {})

	if job == 0 then
		require("vim").api.nvim_err_writeln("termopen() failed, invalid argument")
		return
	elseif job == -1 then
		require("vim").api.nvim_err_writeln("termopen() failed, command or shell is not executable")
		return
	end
end

return M
