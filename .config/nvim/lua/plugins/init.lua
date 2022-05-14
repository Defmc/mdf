local bootstrap = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
	  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	end
end

bootstrap()

require("packer").startup(function(use)
	use "wbthomason/packer.nvim"
	use "mg979/vim-visual-multi"
	use {
		"nvim-treesitter/nvim-treesitter",
		run = "TSUpdate"
	}
	use { "kyazdani42/nvim-tree.lua",
	      cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	      setup = function()
		      require("plugins.maps").nvim_tree()
	      end,
	      config = function()
		      require("nvim-tree").setup()
	      end,
		requires = {'kyazdani42/nvim-web-devicons'}
	   }
	use {
		'rcarriga/nvim-notify',
		config = function()
			vim.notify = require('notify')
			vim.warn = vim.notify
			vim.error = vim.warn
		end
	}
	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'folke/tokyonight.nvim'
	use {
	    'numToStr/Comment.nvim',
	    config = function()
		require('Comment').setup()
	    end
	}
	use "lukas-reineke/indent-blankline.nvim"

	  if packer_bootstrap then
	    require('packer').sync()
	  end
end)
