local M = {}

M.update = function()
	require("vim").cmd([[PackerSync]])
	require("vim").cmd([[TSUpdate]])
	require("vim").cmd([[Mason]])
end

return M
