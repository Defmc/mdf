local maps = require("plugins.maps")
local plugins = {
	{
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("plugins.bufferline")
		end,
	},
	{
		"mhartington/formatter.nvim",
		config = function()
			require("plugins.setups").format()
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{ "williamboman/nvim-lsp-installer" },
	{
		"neovim/nvim-lspconfig",
		after = "nvim-lsp-installer",
		config = function()
			require("plugins.setups").installer()
			require("plugins.maps").lsp()
			require("plugins.lspconfig")
		end,
	},
	{ "onsails/lspkind.nvim", after = "nvim-lspconfig" },
	{
		"nvim-lua/lsp_extensions.nvim",
		after = "nvim-lspconfig",
	},
	{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
	{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
	{ "hrsh7th/cmp-path", after = "nvim-cmp" },
	{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.cmp")
		end,
	},
	{ "L3MON4D3/LuaSnip", after = "nvim-cmp" },
	{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
	{ "wbthomason/packer.nvim" },
	{ "mg979/vim-visual-multi" },
	{ "nvim-treesitter/nvim-treesitter", run = "TSUpdate" },
	{
		"kyazdani42/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		setup = function()
			require("plugins.maps").nvim_tree()
		end,
		config = function()
			require("nvim-tree").setup()
		end,
		requires = { "kyazdani42/nvim-web-devicons" },
	},
	{ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" },
	{ "folke/tokyonight.nvim" },
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("startup").setup({ theme = "bad" })
		end,
	},
	{
		"SmiteshP/nvim-gps",
		config = function()
			require("nvim-gps").setup()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.setups").statusline()
		end,
	},
	{ "lukas-reineke/indent-blankline.nvim" },
}

local bootstrap = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		return fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	else
		return false
	end
end

require("packer").startup(function(use)
	local bootstrapped = bootstrap()
	for _, pkg in ipairs(plugins) do
		local stts, err = use(pkg)
		if err ~= nil then
			vim.print("an error ocurred loading " .. pkg)
		end
	end

	if bootstrapped then
		require("packer").sync()
	end
end)
