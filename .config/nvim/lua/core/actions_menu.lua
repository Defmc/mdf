local M = {}

M.tasks = {
	["rust"] = {
		["build debug"] = function()
			require("vim").cmd(":terminal cargo run")
		end,
		["build release"] = function()
			require("vim").cmd(":terminal cargo run --release")
		end,
		["cargo test"] = function()
			require("vim").cmd(":terminal cargo test --all -- --test-threads=1")
		end,
	},
	["global"] = {
		["update"] = {
			["packages"] = function()
				require("vim").cmd(":PackerSync")
			end,
			["lsp tools"] = function()
				require("plugins.lsp.mason_updater").update_all()
			end,
			["parsers"] = function()
				require("vim").cmd(":TSUpdate")
			end,
			["all"] = function()
				require("vim").cmd(":TSUpdate")
				require("plugins.lsp.mason_updater").update_all()
				require("vim").cmd(":PackerSync")
			end,
		},
	},
}

M.task_runner = function()
	local ft = require("vim").bo.filetype
	local tasks = M.tasks[ft]
	if tasks == nil then
		tasks = {}
	end
	tasks = require("vim").tbl_deep_extend("error", tasks, M.tasks["global"])
	M.task_menu(tasks)
end

M.task_menu = function(options)
	local ui_tasks = {}
	for k, _ in pairs(options) do
		table.insert(ui_tasks, k)
	end
	require("vim").ui.select(ui_tasks, {}, function(name, _)
		local task = options[name]
		if type(task) == "table" then
			M.task_menu(task)
		elseif type(task) == "function" then
			task()
		end
	end)
end

return M
