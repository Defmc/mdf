local M = {}

M.setup = function()
	local lspactions = require("lspactions")

	require("vim").ui.select = lspactions.select
	require("vim").ui.input = lspactions.input

	require("vim").lsp.handlers["textDocument/references"] = lspactions.references
	require("vim").lsp.handlers["textDocument/definition"] = lspactions.definition
	require("vim").lsp.handlers["textDocument/declaration"] = lspactions.declaration
	require("vim").lsp.handlers["textDocument/codeAction"] = function()
		require("vim").cmd("CodeActionMenu")
	end
	require("vim").lsp.handlers["textDocument/implementation"] = lspactions.implementation
end

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
}

M.tasks_win = {
	relative = "win",
	width = 120,
	height = 10,
	border = "single",
	row = 20,
	col = 20,
}

M.task_runner = function()
	local ft = require("vim").bo.filetype
	local tasks = M.tasks[ft]
	local ui_tasks = {}
	for k, _ in pairs(tasks) do
		table.insert(ui_tasks, k)
	end
	require("vim").ui.select(ui_tasks, M.tasks_win, M.run_task)
end

M.run_task = function(name, _)
	local ft = require("vim").bo.filetype
	local task = (M.tasks[ft])[name]
	task()
end

return M
