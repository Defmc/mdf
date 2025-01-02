return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    keys = {
        { "<leader>dpo", '<cmd>lua require("dapui").open() <CR>',            desc = "Open dapui" },
        { "<leader>dpc", '<cmd>lua require("dapui").close() <CR>',           desc = "Close dapui " },
        { "<leader>dpt", '<cmd>lua require("dapui").toggle() <CR>',          desc = "Toggle dapui " },
        { "<leader>db",  '<cmd>lua require("dap").toggle_breakpoint() <CR>', desc = "Toggle breakpoint" },
        { "<leader>dc",  '<cmd>lua require("dap").continue() <CR>',          desc = "Continue debugging" },
        { "<leader>do",  '<cmd>lua require("dap").step_over() <CR>',         desc = "Step over debugging" },
        { "<leader>di",  '<cmd>lua require("dap").step_into() <CR>',         desc = "Step over debugging" },
    },
    config = function()
        require("dapui").setup()
        -- require("vim").fn.sign_define('DapBreakpoint',
        --     { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
    end,
}
