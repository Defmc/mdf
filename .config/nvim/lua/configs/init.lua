local modules = { "editor" }

for _, mod in ipairs(modules) do
	require("configs." .. mod)
end
