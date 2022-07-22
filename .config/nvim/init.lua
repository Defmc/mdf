modules = { "configs", "plugins" }

for _, mod in ipairs(modules) do
	require(mod)
end
