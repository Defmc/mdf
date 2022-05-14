local lsp = require("feline.providers.lsp")
local vi_mode_utils = require("feline.providers.vi_mode")

local tokyonight_colors = require("tokyonight.colors").setup({ style = "storm" })

local colors = {
	bg = tokyonight_colors.bg_statusline,
	fg = tokyonight_colors.fg,
	yellow = tokyonight_colors.yellow,
	cyan = tokyonight_colors.cyan,
	darkblue = tokyonight_colors.blue0,
	green = tokyonight_colors.green,
	orange = tokyonight_colors.orange,
	violet = tokyonight_colors.purple,
	magenta = tokyonight_colors.magenta,
	blue = tokyonight_colors.blue,
	red = tokyonight_colors.red,
	light_bg = tokyonight_colors.bg_highlight,
	primary_blue = tokyonight_colors.blue5,
}

local vi_mode_colors = {
	NORMAL = colors.primary_blue,
	OP = colors.primary_blue,
	INSERT = colors.yellow,
	VISUAL = colors.magenta,
	LINES = colors.magenta,
	BLOCK = colors.magenta,
	REPLACE = colors.red,
	["V-REPLACE"] = colors.red,
	ENTER = colors.cyan,
	MORE = colors.cyan,
	SELECT = colors.orange,
	COMMAND = colors.blue,
	SHELL = colors.green,
	TERM = colors.green,
	NONE = colors.green,
}

local vi_mode_text = {
	NORMAL = "<|",
	OP = "<|",
	INSERT = "|>",
	VISUAL = "<>",
	LINES = "<>",
	BLOCK = "<>",
	REPLACE = "<>",
	["V-REPLACE"] = "<>",
	ENTER = "<>",
	MORE = "<>",
	SELECT = "<>",
	COMMAND = "<|",
	SHELL = "<|",
	TERM = "<|",
	NONE = "<>",
	CONFIRM = "|>",
}

local vimode = {
	provider = " 烈",
	hl = function()
		local val = {}

		val.bg = vi_mode_utils.get_mode_color()
		val.fg = "black"
		val.style = "bold"

		return val
	end,
	right_sep = " ",
}

local visymbol = {
	provider = function()
		return vi_mode_text[vi_mode_utils.get_vim_mode()]
	end,
	hl = function()
		local val = {}
		val.fg = vi_mode_utils.get_mode_color()
		val.bg = "bg"
		val.style = "bold"
		return val
	end,
	right_sep = " ",
}

local gps = {
	provider = function()
		return require("nvim-gps").get_location()
	end,
	enabled = function()
		return require("nvim-gps").is_available()
	end,
	hl = {
		fg = "white",
		bg = "bg",
		style = "bold",
	},
}

local gitbranch = {
	provider = "git_branch",
	hl = {
		fg = "yellow",
		bg = "bg",
		style = "bold",
	},
}

local gitdiffadd = {
	provider = "git_diff_added",
	hl = {
		fg = "green",
		bg = "bg",
		style = "bold",
	},
}

local gitdiffmod = {
	provider = "git_diff_changed",
	hl = {
		fg = "orange",
		bg = "bg",
		style = "bold",
	},
}

local gitdiffrm = {
	provider = "git_diff_removed",
	hl = {
		fg = "red",
		bg = "bg",
		style = "bold",
	},
}

local diag_err = {
	provider = "diagnostic_errors",
	enabled = function()
		return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR)
	end,
	hl = {
		fg = "red",
		style = "bold",
	},
}

local diag_warn = {
	provider = "diagnostic_warnings",
	enabled = function()
		return lsp.diagnostics_exist(vim.diagnostic.severity.WARN)
	end,
	hl = {
		fg = "yellow",
		style = "bold",
	},
}

local diag_hint = {
	provider = "diagnostic_hints",
	enabled = function()
		return lsp.diagnostics_exist(vim.diagnostic.severity.HINT)
	end,
	hl = {
		fg = "cyan",
		style = "bold",
	},
}

local diag_info = {
	provider = "diagnostic_info",
	enabled = function()
		return lsp.diagnostics_exist(vim.diagnostic.severity.INFO)
	end,
	hl = {
		fg = "skyblue",
		style = "bold",
	},
}

local lspprog = {
	provider = function()
		local Lsp = vim.lsp.util.get_progress_messages()[1]

		if Lsp then
			local msg = Lsp.message or ""
			local percentage = Lsp.percentage or 0
			local title = Lsp.title or ""
			local spinners = {
				"",
				"",
				"",
			}

			local success_icon = {
				"",
				"",
				"",
			}

			local ms = vim.loop.hrtime() / 1000000
			local frame = math.floor(ms / 120) % #spinners

			if percentage >= 70 then
				return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
			end

			return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
		end

		return ""
	end,
	hl = { fg = colors.green },
}

local lspname = {
	provider = "lsp_client_names",
	hl = {
		fg = "yellow",
		bg = "bg",
		style = "bold",
	},
	right_sep = " ",
}

local file_icon = {
	provider = function()
		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local icon = require("nvim-web-devicons").get_icon(filename, extension)
		if icon == nil then
			icon = ""
		end
		return icon
	end,
	hl = function()
		local val = {}
		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local icon, name = require("nvim-web-devicons").get_icon(filename, extension)
		if icon ~= nil then
			val.fg = vim.fn.synIDattr(vim.fn.hlID(name), "fg")
		else
			val.fg = "white"
		end
		val.bg = "bg"
		val.style = "bold"
		return val
	end,
	right_sep = " ",
}

local file_type = {
	provider = "file_type",
	hl = function()
		local val = {}
		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local icon, name = require("nvim-web-devicons").get_icon(filename, extension)
		if icon ~= nil then
			val.fg = vim.fn.synIDattr(vim.fn.hlID(name), "fg")
		else
			val.fg = "white"
		end
		val.bg = "bg"
		val.style = "bold"
		return val
	end,
	right_sep = " ",
}

local file_size = {
	provider = "file_size",
	enabled = function()
		return vim.fn.getfsize(vim.fn.expand("%:t")) > 0
	end,
	hl = {
		fg = "skyblue",
		bg = "bg",
		style = "bold",
	},
	right_sep = " ",
}

local file_format = {
	provider = function()
		return "" .. vim.bo.fileformat:upper() .. ""
	end,
	hl = {
		fg = "white",
		bg = "bg",
		style = "bold",
	},
	right_sep = " ",
}

local file_enc = {
	provider = "file_encoding",
	hl = {
		fg = "white",
		bg = "bg",
		style = "bold",
	},
	right_sep = " ",
}

local file_info = {
	provider = "position",
	hl = {
		fg = "white",
		bg = "bg",
		style = "bold",
	},
	right_sep = " ",
}

local file_perc = {
	provider = "line_percentage",
	hl = {
		fg = "white",
		bg = "bg",
		style = "bold",
	},
	right_sep = " ",
}

local scrollbar = {
	provider = "scroll_bar",
	hl = {
		fg = "yellow",
		bg = "bg",
	},
}

local components = {
	active = {
		[1] = { vimode, visymbol, gps },
		[2] = {
			gitbranch,
			gitdiffadd,
			gitdiffmod,
			gitdiffrm,
			diag_err,
			diag_warn,
			diag_hint,
			diag_info,
		},
		[3] = {
			lspprog,
			lspname,
			file_icon,
			file_type,
			-- file_format,
			-- file_size,
			-- file_enc,
			--			file_info,
			file_perc,
			scrollbar,
		},
	},
	inactive = {
		[1] = { vimode, visymbol },
		[2] = {},
		[3] = {
			lspprog,
			lspname,
			file_type,
			file_info,
			file_perc,
			scrollbar,
		},
	},
}

local force_inactive = {
	filetypes = {},
	buftypes = {},
	bufnames = {},
}

force_inactive.filetypes = {
	"NvimTree",
	"dbui",
	"packer",
	"startify",
	"startup",
	"fugitive",
	"fugitiveblame",
}

force_inactive.buftypes = {
	--	"terminal",
}

require("feline").setup({
	theme = colors,
	default_bg = bg,
	default_fg = fg,
	vi_mode_colors = vi_mode_colors,
	components = components,
	force_inactive = force_inactive,
})
