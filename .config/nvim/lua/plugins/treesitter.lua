return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		local options = {
			ensure_installed = {},
			highlight = {
				enable = true,
				use_languagetree = true,
			},
		}

		require("nvim-treesitter.configs").setup(options)
	end,
}
