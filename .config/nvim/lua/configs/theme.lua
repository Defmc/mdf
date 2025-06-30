local M = {}

M.borderty = "single"

M.border = function(hl_name)
    return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name },
    }
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
    Warn = "",
    Info = "",
    Hint = "",
    Added = "",
    Modified = "",
    Removed = "",
}

M.palette = function()
    local matchs = {
        gruvbox = function()
            return require("gruvbox").palette
        end
    }
    local fallback = matchs[require("vim").g.colors_name or nil] or function() end
    return fallback()
end

return M
