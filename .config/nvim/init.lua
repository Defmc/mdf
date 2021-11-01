-- Plugins
require("packer").startup(
    function()
        -- LSP
        use 'neovim/nvim-lspconfig' 
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
require("nvim_tree").setup()
require("line_indent").setup()
require("nvim_treesitter").setup()
require("nvim-autopairs").setup {}


