MODULES = { "configs", "plugins" }
VIM = vim.cmd

for _, mod in ipairs(MODULES) do
	require(mod)
end
