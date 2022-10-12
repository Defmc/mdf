local plugins = {
	{
		"lewis6991/impatient.nvim",
		config = function()
			require("impatient")
		end,
	},
	{ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } },
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("plugins.bufferline")
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"williamboman/mason.nvim",
		requires = {
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",
			"nvim-lua/plenary.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("configs.maps").lsp()
			require("plugins.setups").mason()
			require("plugins.lsp.config")
		end,
	},
	{
		"mhartington/formatter.nvim",
		config = function()
			require("plugins.setups").formatter()
		end,
	},
	{
		"RishabhRD/lspactions",
		requires = { "weilbith/nvim-code-action-menu", "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
		after = "nvim-lspconfig",
		config = function()
			require("plugins.lsp.actions").setup()
		end,
	},
	{
		"folke/trouble.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			"folke/lsp-colors.nvim",
		},
		after = "nvim-lspconfig",
		config = function()
			require("plugins.lsp.diags")
		end,
	},
	{ "onsails/lspkind.nvim", after = "nvim-lspconfig" },
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
	{
		"nvim-treesitter/nvim-treesitter",
		run = "TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	},
	{
		"kyazdani42/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		setup = function()
			require("configs.maps").nvim_tree()
		end,
		config = function()
			require("plugins.nvimtree")
		end,
		requires = { "kyazdani42/nvim-web-devicons" },
	},
	{
		"nvim-telescope/telescope.nvim",
		requires = "nvim-lua/plenary.nvim",
		setup = function()
			require("configs.maps").telescope()
		end,
	},
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
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
		config = function()
			require("plugins.lsp.navic")
		end,
	},
	{
		"feline-nvim/feline.nvim",
		config = function()
			require("plugins.statusline")
		end,
	},
	{ "lukas-reineke/indent-blankline.nvim" },
	{
		"simrat39/rust-tools.nvim",
		after = "nvim-lspconfig",
		config = function()
			require("plugins.lsp.rs_tools")
		end,
	},
}

local bootstrap = function()
	local fn = require("vim").fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		return fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	else
		return false
	end
end

local sync_pkgs = function(use)
	local bootstrapped = bootstrap()
	for _, pkg in ipairs(plugins) do
		local _, err = use(pkg)
		if err ~= nil then
			require("vim").print("an error ocurred loading " .. pkg)
		end
	end

	if bootstrapped then
		require("packer").sync()
	end
end

require("packer").startup({
	sync_pkgs,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
