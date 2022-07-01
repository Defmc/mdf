local M = {}

M.update = function()
	vim.cmd([[PackerSync]])
	vim.cmd([[TSUpdate]])
	vim.cmd([[LspInstallInfo]])
end

return M
