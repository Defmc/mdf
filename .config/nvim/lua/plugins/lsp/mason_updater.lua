-- Taken from https://github.com/RubixDev/mason-update-all/blob/main/lua/mason-update-all/init.lua
local registry = require("mason-registry")

local M = {}

local function check_done(running_count, any_update)
	if running_count == 0 then
		if any_update then
			print("[mason] finished updating all packages")
		else
			print("[mason] nothing to update")
		end

		-- Trigger autocmd
		require("vim").schedule(function()
			require("vim").api.nvim_exec_autocmds("User", {
				pattern = "MasonUpdateAllComplete",
			})
		end)
	end
end

function M.update_all()
	local any_update = false -- Whether any package was updated
	local running_count = 0 -- Currently running jobs

	print("[mason] fetching updates")
	-- Iterate installed packages
	for _, pkg in ipairs(registry.get_installed_packages()) do
		running_count = running_count + 1

		-- Fetch for new version
		pkg:check_new_version(function(new_available, version)
			if new_available then
				any_update = true
				print(
					("[mason] updating %s from %s to %s"):format(
						pkg.name,
						version.current_version,
						version.latest_version
					)
				)
				pkg:install():on("closed", function()
					running_count = running_count - 1
					print(("[mason] updated %s to %s"):format(pkg.name, version.latest_version))

					-- Done
					check_done(running_count, any_update)
				end)
			else
				running_count = running_count - 1
			end

			-- Done
			check_done(running_count, any_update)
		end)
	end
end

function M.setup()
	require("vim").api.nvim_create_user_command("MasonUpdateAll", M.update_all, {})
end

return M
