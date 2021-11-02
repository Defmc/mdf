require("packer").startup(
    function()
        -- LSP
        use 'neovim/nvim-lspconfig'
        use 'nvim-lua/popup.nvim'
        use 'nvim-lua/plenary.nvim'
        use 'nvim-telescope/telescope.nvim'
        use 'simrat39/rust-tools.nvim'
        use 'mfussenegger/nvim-dap'
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-vsnip'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/vim-vsnip'

        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }
 
        -- Editor
        use 'mhinz/vim-startify'
        use 'windwp/nvim-autopairs'
        use 'mg979/vim-visual-multi'
        use 'itchyny/lightline.vim'
        use 'folke/tokyonight.nvim'
        use 'lukas-reineke/indent-blankline.nvim'

        -- NvimTree
        use 'kyazdani42/nvim-web-devicons'
        use 'kyazdani42/nvim-tree.lua'

        -- Highlighting
        use 'cespare/vim-toml'
        use 'cdelledonne/vim-cmake'
    end
)
