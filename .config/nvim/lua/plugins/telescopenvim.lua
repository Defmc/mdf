return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "ff", "<cmd>Telescope find_files <CR>",  desc = "Find files" },
        { "fg", "<cmd>Telescope live_grep <CR>",   desc = "Live grep" },
        { "fb", "<cmd>Telescope buffers <CR>",     desc = "Buffers" },
        { "fh", "<cmd>Telescope help_tags <CR>",   desc = "Help tags" },
        { "fc", "<cmd>Telescope colorscheme <CR>", desc = "Colorscheme" },
        { "ft", "<cmd>Telescope treesitter <CR>",  desc = "Treesitter" },
    },
    opts = ...
}
