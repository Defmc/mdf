-- Plugins
require("packer").startup(
    function()
        -- LSP
        use 'neovim/nvim-lspconfig'
        use 'nvim-lua/popup.nvim'
        use 'nvim-lua/plenary.nvim'
        use 'nvim-telescope/telescope.nvim'
        use 'simrat39/rust-tools.nvim'
        use 'mfussenegger/nvim-dap'

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

require("theme").setup()
require("keymap").setup()
require("builtin").setup()
require("lsp_cfg").setup()
require("startify").setup()
require("nvim_tree").setup()
require("line_indent").setup()
require("nvim-autopairs").setup()
require("nvim_treesitter").setup()
