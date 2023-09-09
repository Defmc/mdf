local M = {}

M.dapui = {
	icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	-- Expand lines larger than the window
	-- Requires >= 0.7
	expand_lines = require("vim").fn.has("nvim-0.7") == 1,
	-- Layouts define sections of the screen to place windows.
	-- The position can be "left", "right", "top" or "bottom".
	-- The size specifies the height/width depending on position. It can be an Int
	-- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
	-- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
	-- Elements are the elements shown in the layout (in order).
	-- Layouts are opened in order so that earlier layouts take priority in window sizing.
	layouts = {
		{
			elements = {
				-- Elements can be strings or table with id and size keys.
				{ id = "scopes", size = 0.25 },
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 0.5,
			position = "left",
		},
		{
			elements = {
				"repl",
				"console",
			},
			size = 0.25,
			position = "bottom",
		},
	},
	controls = {
		-- Requires Neovim nightly (or 0.8 when released)
		enabled = true,
		-- Display controls in this element
		element = "repl",
		icons = {
			pause = "",
			play = "契",
			step_into = "",
			step_over = "",
			step_out = "",
			step_back = "倫",
			run_last = "菱",
			terminate = "",
		},
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "rounded", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
		max_value_lines = 100, -- Can be integer or nil.
	},
}

M.lldb = {
	name = "Launch lldb",
	type = "lldb", -- matches the adapter
	request = "launch", -- could also attach to a currently running process
	program = function()
		os.execute([[ sh -c '[ ! "$(pidof codelldb)" ] && codelldb --port 13000 &' ]])
		return require("vim").fn.input("Path to executable: ", require("vim").fn.getcwd() .. "/", "file")
	end,
	cwd = "${workspaceFolder}",
	args = {},
	runtimeArgs = M.program_args,
	terminal = "integrated",
}

M.program_args = {}

M.set_args = function()
	local fill_inputs = function(amount)
		amount = tonumber(amount)
		M.program_args = {}
		M.next_arg(0, amount)
	end
	require("vim").ui.input({ prompt = "Args amount" }, fill_inputs)
	M.lldb.runtimeArgs = M.program_args
end

M.next_arg = function(n, total)
	if n == total then
		return
	end
	require("vim").ui.input({ prompt = "arg no. " .. n }, function(arg)
		table.insert(M.program_args, arg)
		M.next_arg(n + 1, total)
	end)
end

M.setup = function()
	require("mason-nvim-dap").setup({
		automatic_setup = true,
	})

	require("dapui").setup({ M.dapui })

	local dap = require("dap")

	dap.adapters.lldb = {
		type = "server",
		host = "127.0.0.1",
		port = 13000,
	}

	require("configs.maps").debug()

	dap.configurations.rust = { M.lldb }
	dap.configurations.cpp = { M.lldb }
	dap.configurations.c = { M.lldb }

	require("vim").cmd([[
        augroup daprepl
          autocmd FileType dap-repl set nobuflisted
        augroup end
    ]])
end

return M
