MODULES = { "configs", "plugins" }

for _, mod in ipairs(MODULES) do
	require(mod)
end
