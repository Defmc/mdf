local spaced_icons = function(icons)
    local spaced_map = {}
    for k, v in pairs(icons) do
        spaced_map[k] = v .. " "
    end
    return spaced_map
end

return {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig",
    after = "onsails/lspkind.nvim",
    opts = {
        icons = spaced_icons(require("configs.theme").icons),
        highlight = false,
        separator = " > ",
        depth_limit = 0,
        depth_limit_indicator = "..",
    }
}
