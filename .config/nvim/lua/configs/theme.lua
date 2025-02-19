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

return M
