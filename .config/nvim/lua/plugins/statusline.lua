-- local lsp = require("feline.providers.lsp")
-- local vi_mode_utils = require("feline.providers.vi_mode")
--
-- local colors = require("configs.theme").colors
--
-- local vi_mode_colors = {
-- 	NORMAL = colors.primary_blue,
-- 	OP = colors.primary_blue,
-- 	INSERT = colors.yellow,
-- 	VISUAL = colors.magenta,
-- 	LINES = colors.magenta,
-- 	BLOCK = colors.magenta,
-- 	REPLACE = colors.red,
-- 	["V-REPLACE"] = colors.red,
-- 	ENTER = colors.cyan,
-- 	MORE = colors.cyan,
-- 	SELECT = colors.orange,
-- 	COMMAND = colors.blue,
-- 	SHELL = colors.green,
-- 	TERM = colors.green,
-- 	NONE = colors.green,
-- }
--
-- local vi_mode_text = {
-- 	NORMAL = "<|",
-- 	OP = "<|",
-- 	INSERT = "|>",
-- 	VISUAL = "<>",
-- 	LINES = "<>",
-- 	BLOCK = "<>",
-- 	REPLACE = "<>",
-- 	["V-REPLACE"] = "<>",
-- 	ENTER = "<>",
-- 	MORE = "<>",
-- 	SELECT = "<>",
-- 	COMMAND = "<|",
-- 	SHELL = "<|",
-- 	TERM = "<|",
-- 	NONE = "<>",
-- 	CONFIRM = "|>",
-- }
--
-- local vimode = {
-- 	provider = " 󰒠 ",
-- 	hl = function()
-- 		local val = {}
--
-- 		val.bg = vi_mode_utils.get_mode_color()
-- 		val.fg = "black"
-- 		val.style = "bold"
--
-- 		return val
-- 	end,
-- 	right_sep = " ",
-- }
--
-- local visymbol = {
-- 	provider = function()
-- 		return vi_mode_text[vi_mode_utils.get_vim_mode()]
-- 	end,
-- 	hl = function()
-- 		local val = {}
-- 		val.fg = vi_mode_utils.get_mode_color()
-- 		val.bg = "bg"
-- 		val.style = "bold"
-- 		return val
-- 	end,
-- 	right_sep = " ",
-- }
--
-- local gps = {
-- 	provider = function()
-- 		return require("nvim-navic").get_location({})
-- 	end,
-- 	enabled = function()
-- 		return require("nvim-navic").is_available()
-- 	end,
-- 	hl = {
-- 		fg = "white",
-- 		bg = "bg",
-- 		style = "bold",
-- 	},
-- }
--
-- local gitbranch = {
-- 	provider = "git_branch",
-- 	hl = {
-- 		fg = "yellow",
-- 		bg = "bg",
-- 		style = "bold",
-- 	},
-- }
--
-- local gitdiffadd = {
-- 	provider = "git_diff_added",
-- 	hl = {
-- 		fg = "green",
-- 		bg = "bg",
-- 		style = "bold",
-- 	},
-- }
--
-- local gitdiffmod = {
-- 	provider = "git_diff_changed",
-- 	hl = {
-- 		fg = "orange",
-- 		bg = "bg",
-- 		style = "bold",
-- 	},
-- }
--
-- local sep = {
-- 	provider = " ",
-- }
--
-- local gitdiffrm = {
-- 	provider = "git_diff_removed",
-- 	hl = {
-- 		fg = "red",
-- 		bg = "bg",
-- 		style = "bold",
-- 	},
-- }
--
-- local diag_err = {
-- 	provider = "diagnostic_errors",
-- 	enabled = function()
-- 		return lsp.diagnostics_exist(require("vim").diagnostic.severity.ERROR)
-- 	end,
-- 	hl = {
-- 		fg = "red",
-- 		style = "bold",
-- 	},
-- }
--
-- local diag_warn = {
-- 	provider = "diagnostic_warnings",
-- 	enabled = function()
-- 		return lsp.diagnostics_exist(require("vim").diagnostic.severity.WARN)
-- 	end,
-- 	hl = {
-- 		fg = "yellow",
-- 		style = "bold",
-- 	},
-- }
--
-- local diag_hint = {
-- 	provider = "diagnostic_hints",
-- 	enabled = function()
-- 		return lsp.diagnostics_exist(require("vim").diagnostic.severity.HINT)
-- 	end,
-- 	hl = {
-- 		fg = "cyan",
-- 		style = "bold",
-- 	},
-- }
--
-- local diag_info = {
-- 	provider = "diagnostic_info",
-- 	enabled = function()
-- 		return lsp.diagnostics_exist(require("vim").diagnostic.severity.INFO)
-- 	end,
-- 	hl = {
-- 		fg = "skyblue",
-- 		style = "bold",
-- 	},
-- }
--
-- local lspprog = {
-- 	provider = function()
-- 		local Lsp = require("vim").lsp.util.get_progress_messages()[1]
--
-- 		if Lsp then
-- 			local msg = Lsp.message or ""
-- 			local percentage = Lsp.percentage or 0
-- 			local title = Lsp.title or ""
-- 			local spinners = {
-- 				"",
-- 				"",
-- 				"",
-- 			}
--
-- 			local success_icon = {
-- 				"",
-- 				"",
-- 				"",
-- 			}
--
-- 			local ms = require("vim").loop.hrtime() / 1000000
-- 			local frame = math.floor(ms / 120) % #spinners
--
-- 			if percentage >= 70 then
-- 				return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
-- 			end
--
-- 			return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
-- 		end
--
-- 		return ""
-- 	end,
-- 	hl = { fg = colors.green },
-- }
--
-- local lspname = {
-- 	provider = "lsp_client_names",
-- 	hl = {
-- 		fg = "yellow",
-- 		bg = "bg",
-- 		style = "bold",
-- 	},
-- 	right_sep = " ",
-- }
--
-- local file_icon = {
-- 	provider = function()
-- 		local filename = require("vim").fn.expand("%:t")
-- 		local extension = require("vim").fn.expand("%:e")
-- 		local icon = require("nvim-web-devicons").get_icon(filename, extension)
-- 		if icon == nil then
-- 			icon = ""
-- 		end
-- 		return icon
-- 	end,
-- 	hl = function()
-- 		local val = {}
-- 		local filename = require("vim").fn.expand("%:t")
-- 		local extension = require("vim").fn.expand("%:e")
-- 		local icon, name = require("nvim-web-devicons").get_icon(filename, extension)
-- 		if icon ~= nil then
-- 			val.fg = require("vim").fn.synIDattr(require("vim").fn.hlID(name), "fg")
-- 		else
-- 			val.fg = "white"
-- 		end
-- 		val.bg = "bg"
-- 		val.style = "bold"
-- 		return val
-- 	end,
-- 	right_sep = " ",
-- }
--
-- local file_type = {
-- 	provider = "file_type",
-- 	hl = function()
-- 		local val = {}
-- 		local filename = require("vim").fn.expand("%:t")
-- 		local extension = require("vim").fn.expand("%:e")
-- 		local icon, name = require("nvim-web-devicons").get_icon(filename, extension)
-- 		if icon ~= nil then
-- 			val.fg = require("vim").fn.synIDattr(require("vim").fn.hlID(name), "fg")
-- 		else
-- 			val.fg = "white"
-- 		end
-- 		val.bg = "bg"
-- 		val.style = "bold"
-- 		return val
-- 	end,
-- 	right_sep = " ",
-- }
--
-- local file_size = {
-- 	provider = "file_size",
-- 	enabled = function()
-- 		return require("vim").fn.getfsize(require("vim").fn.expand("%:t")) > 0
-- 	end,
-- 	hl = {
-- 		fg = "skyblue",
-- 		bg = "bg",
-- 		style = "bold",
-- 	},
-- 	right_sep = " ",
-- }
--
-- local file_format = {
-- 	provider = function()
-- 		return "" .. require("vim").bo.fileformat:upper() .. ""
-- 	end,
-- 	hl = {
-- 		fg = "white",
-- 		bg = "bg",
-- 		style = "bold",
-- 	},
-- 	right_sep = " ",
-- }
--
-- local file_enc = {
-- 	provider = "file_encoding",
-- 	hl = {
-- 		fg = "white",
-- 		bg = "bg",
-- 		style = "bold",
-- 	},
-- 	right_sep = " ",
-- }
--
-- local file_info = {
-- 	provider = "position",
-- 	hl = {
-- 		fg = "white",
-- 		bg = "bg",
-- 		style = "bold",
-- 	},
-- 	right_sep = " ",
-- }
--
-- local file_perc = {
-- 	provider = "line_percentage",
-- 	hl = {
-- 		fg = "white",
-- 		bg = "bg",
-- 		style = "bold",
-- 	},
-- 	right_sep = " ",
-- }
--
-- local scrollbar = {
-- 	provider = "scroll_bar",
-- 	hl = {
-- 		fg = "yellow",
-- 		bg = "bg",
-- 	},
-- }
--
-- local components = {
-- 	active = {
-- 		[1] = { vimode, visymbol, gps },
-- 		[2] = {},
-- 		[3] = {
-- 			diag_err,
-- 			diag_warn,
-- 			diag_hint,
-- 			diag_info,
-- 			sep,
-- 			gitdiffadd,
-- 			gitdiffmod,
-- 			gitdiffrm,
-- 			sep,
-- 			gitbranch,
-- 			sep,
-- 			lspprog,
-- 			lspname,
-- 			file_icon,
-- 			-- file_type,
-- 			-- file_format,
-- 			-- file_size,
-- 			-- file_enc,
-- 			--			file_info,
-- 			file_perc,
-- 			scrollbar,
-- 		},
-- 	},
-- 	inactive = {
-- 		[1] = { vimode, visymbol },
-- 		[2] = {},
-- 		[3] = {
-- 			lspprog,
-- 			lspname,
-- 			--			file_type,
-- 			file_info,
-- 			file_perc,
-- 			scrollbar,
-- 		},
-- 	},
-- }
--
-- local force_inactive = {
-- 	filetypes = {},
-- 	buftypes = {},
-- 	bufnames = {},
-- }
--
-- force_inactive.filetypes = {
-- 	"NvimTree",
-- 	"dbui",
-- 	"packer",
-- 	"startify",
-- 	"startup",
-- 	"fugitive",
-- 	"fugitiveblame",
-- }
--
-- force_inactive.buftypes = {
-- 	--	"terminal",
-- }
--
-- require("feline").setup({
-- 	theme = colors,
-- 	default_bg = colors.bg,
-- 	default_fg = colors.fg,
-- 	vi_mode_colors = vi_mode_colors,
-- 	components = components,
-- 	force_inactive = force_inactive,
-- })
local icons = require("lspkind").symbol_map
local color_theme = require("configs.theme").colors

local diff_config = {
	"diff",
	colored = true, -- Displays a colored diff status if set to true
	diff_color = {
		-- Same color values as the general color option can be used here.
		added = { fg = color_theme.green }, -- Changes the diff's added color
		modified = { fg = color_theme.orange }, -- Changes the diff's modified color
		removed = { fg = color_theme.red }, -- Changes the diff's removed color you
	},
	symbols = { added = icons.Added .. " ", modified = icons.Modified .. " ", removed = icons.Removed .. " " }, -- Changes the symbols used by the diff.
	source = function()
		local gitsigns = require("vim").b.gitsigns_status_dict
		if gitsigns then
			return {
				added = gitsigns.added,
				modified = gitsigns.changed,
				removed = gitsigns.removed,
			}
		end
	end, -- A function that works as a data source for diff.
	-- It must return a table as such:
	--   { added = add_count, modified = modified_count, removed = removed_count }
	-- or nil on failure. count <= 0 won't be displayed.
	color = { gui = "bold" },
}

local navic = require("nvim-navic")
local navic_config = {
	function()
		return navic.get_location({})
	end,
	cond = navic.is_available,
}

local lspprog_config = {
	function()
		local messages = require("vim").lsp.util.get_progress_messages()
		if #messages == 0 then
			return ""
		end
		local status = {}
		for _, msg in pairs(messages) do
			table.insert(status, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
		end
		local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
		local ms = require("vim").loop.hrtime() / 1000000
		local frame = math.floor(ms / 120) % #spinners
		return (table.concat(status, " | ") .. " " .. spinners[frame + 1]) or ""
	end,
	color = { fg = color_theme.orange },
	separator = "",
}

local lspname = {
	function()
		local msg = "󰟢"
		local buf_ft = require("vim").api.nvim_buf_get_option(0, "filetype")
		local clients = require("vim").lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and require("vim").fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	color = { fg = color_theme.orange },
}

local mode_highlight_config = {
	function()
		return ""
	end,
	color = { gui = "bold" },
}

require("lualine").setup({
	options = { theme = "auto" },
	sections = {
		lualine_a = { mode_highlight_config },
		lualine_b = { { "b:gitsigns_head", icon = "󰘬" }, diff_config, "diagnostics" },
		lualine_c = { navic_config },
		lualine_x = { lspprog_config, lspname, { "filetype", color = { gui = "bold" } } },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
