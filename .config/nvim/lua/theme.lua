local theme = {}

function theme.setup()
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
end

return theme
