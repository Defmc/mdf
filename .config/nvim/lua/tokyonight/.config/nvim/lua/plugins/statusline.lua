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
