local M = {}

M.map = function(mode, bind, action)
	vim.api.nvim_set_keymap(mode, bind, action, { noremap = true, silent = true })
end

return M
