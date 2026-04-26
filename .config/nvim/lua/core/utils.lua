local M = {}

M.map = function(mode, bind, action)
    vim.keymap.set(mode, bind, action, vim.tbl_extend("force", { noremap = true, silent = true }, opts or {}))
end

M.os_capture = function(cmd)
    local f = assert(io.popen(cmd, "r"))
    local s = assert(f:read("*a"))
    f:close()
    return s
end

M.lines = function(str)
    local t = {}
    local function helper(line)
        table.insert(t, line)
        return ""
    end
    helper((str:gsub("(.-)\r?\n", helper)))
    return t
end

return M
