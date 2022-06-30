local M = {}

M.update = function()
	vim.cmd([[PackerSync]])
	vim.cmd([[TSUpdate]])
	local servers = require("nvim-lsp-installer").get_installed_servers()
	for _, svr in pairs(servers) do
		vim.cmd("LspInstall --sync " .. svr.name)
	end
end

return M
