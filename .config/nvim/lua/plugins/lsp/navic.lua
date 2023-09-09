local spaced_icons = function(icons)
	local spaced_map = {}
	for k, v in pairs(icons) do
		spaced_map[k] = v .. " "
	end
	return spaced_map
end

require("nvim-navic").setup({
	icons = spaced_icons(require("lspkind").symbol_map),
	highlight = false,
	separator = " > ",
	depth_limit = 0,
	depth_limit_indicator = "..",
})
