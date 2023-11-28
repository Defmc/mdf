local options = {
	ensure_installed = {},
	highlight = {
		enable = true,
		use_languagetree = true,
	},
}

require("nvim-treesitter.configs").setup(options)
