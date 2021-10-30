-- Plugins
require("packer").startup(
    function()
        -- LSP
        use "neovim/nvim-lspconfig"
        use {
            "neoclide/coc.nvim",
            branch = "release",
            run = "yarn install --frozen-lockfile"
        }

        -- Editor
        use "mhinz/vim-startify"
        use "windwp/nvim-autopairs"
        use "mg979/vim-visual-multi"
        use "itchyny/lightline.vim"
        use "folke/tokyonight.nvim"
        use "lukas-reineke/indent-blankline.nvim"

        -- NvimTree
        use "kyazdani42/nvim-web-devicons"
        use "kyazdani42/nvim-tree.lua"

        -- Highlighting
        use "cespare/vim-toml"
        use "cdelledonne/vim-cmake"
    end
)

-- Theme
vim.o.termguicolors = true
vim.g.one_allow_italics = true
vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true

vim.o.background = "dark"
vim.g.tokyonight_style = "night"

vim.g.lightline = {colorscheme = "tokyonight"}
vim.cmd("colorscheme tokyonight")

vim.cmd("hi Pmenu ctermfg=white ctermbg=black cterm=NONE guifg=#e1e1e1 guibg=#383838 gui=NONE")
vim.cmd("hi PmenuSel ctermfg=white ctermbg=black cterm=NONE guifg=#b26eff guibg=#4e4e4e gui=NONE")

-- Buffer
vim.o.tabstop = 8
vim.o.shiftwidth = 4
vim.o.softtabstop = 0
vim.o.number = true
vim.o.ttyfast = true
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.lazyredraw = true
vim.o.swapfile = false
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.signcolumn = "yes"

-- KeyMapper
vim.api.nvim_set_keymap("n", "<C-S-Up>", ":m-2<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<C-S-Down>", ":m+1<CR>", {silent = true, noremap = true})

vim.api.nvim_set_keymap("n", "<A-Tab-Left>", ":-tabnext", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<A-Tab-Right>", ":+tabnext", {silent = true, noremap = true})

vim.api.nvim_set_keymap("n", "<space>e", ":NvimTreeToggle<CR>", {silent = true, noremap = true})

vim.api.nvim_set_keymap("n", "<A-Left>", ":vertical resize -5<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<A-Right>", ":vertical resize +5<CR>", {silent = true, noremap = true})

vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gt", "<Plug>(coc-type-definition)<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gi", "<Plug>(coc-implementation)<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<S-A>f", "<Plug>(coc-format-selected)<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<S-A>t", ":call CocAction('format')<CR>", {silent = true, noremap = true})

require("nvim-autopairs").setup {}

-- NvimTree Setup
require "nvim-tree".setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {},
    auto_close = false,
    open_on_tab = false,
    hide_dotfiles = true,
    update_to_buf_dir = {
        enable = true,
        auto_open = true
    },
    hijack_cursor = true,
    update_cwd = false,
    diagnostics = {
        enable = true
    },
    ignore = {".git", "node_modules", ".cache"},
    update_focused_file = {
        enable = false,
        update_cwd = false,
        ignore_list = {}
    },
    system_open = {
        cmd = nil,
        args = {}
    },
    view = {
        width = 30,
        height = 30,
        side = "left",
        auto_resize = false,
        mappings = {
            custom_only = false,
            list = {}
        }
    }
}
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_root_folder_modifier = ":~"
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_disable_window_picker = 1
vim.g.nvim_tree_icon_padding = " "
vim.g.nvim_tree_symlink_arrow = " >> "
vim.g.nvim_tree_respect_buf_cwd = 1
vim.g.nvim_tree_create_in_closed_folder = 0
vim.g.nvim_tree_refresh_wait = 500
vim.g.nvim_tree_window_picker_exclude = {
    filetype = {
        "notify",
        "packer",
        "qf"
    },
    buftype = {"terminal"}
}
vim.g.nvim_tree_special_files = {README = 1, Makefile = 1, MAKEFILE = 1}
vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 0,
    files = 0,
    folder_arrows = 0
}
vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = "◌"
    },
    folder = {
        arrow_open = "",
        arrow_closed = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = ""
    },
    lsp = {
        hint = "",
        info = "",
        warning = "",
        error = ""
    }
}

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    space_char_blankline = "."
}
