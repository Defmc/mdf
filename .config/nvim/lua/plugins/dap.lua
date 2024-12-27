return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	keys = {
		{ "<leader>dpo", '<cmd>lua require("dapui").open() <CR>', desc = "open dapui" },
		{ "<leader>dpc", '<cmd>lua require("dapui").close() <CR>', desc = "close dapui " },
		{ "<leader>dpt", '<cmd>lua require("dapui").toggle() <CR>', desc = "toggle dapui " },
		{ "<leader>db", '<cmd>lua require("dap").toggle_breakpoint() <CR>', desc = "toggle breakpoint" },
		{ "<leader>dc", '<cmd>lua require("dap").continue() <CR>', desc = "continue debugging" },
		{ "<leader>do", '<cmd>lua require("dap").step_over() <CR>', desc = "step over debugging" },
		{ "<leader>di", '<cmd>lua require("dap").step_into() <CR>', desc = "step over debugging" },
	},
	config = function()
		require("dapui").setup()
	end,
}
