" Plugins
call plug#begin()
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim'

" Editor
Plug 'windwp/nvim-autopairs'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'

" Highlighting
Plug 'cespare/vim-toml', {'branch': 'master'}
Plug 'cdelledonne/vim-cmake'
call plug#end()

" Theme
syntax on
set background=dark
set termguicolors
colorscheme onedark
let g:one_allow_italics = 1
let g:lightline = {
	      \ 'colorscheme': 'one',
      \ }


" Keybindings
nnoremap <silent> <A-Up> :m-2<CR>
nnoremap <silent> <A-Down> :m+<CR>
nmap <space>e <Cmd>CocCommand explorer<CR>

nnoremap <silent> <C-v> a<C-r>+<Esc>
inoremap <silent> <C-v> <C-r>+
cnoremap <silent> <C-v> <C-r>+

" Windows Manager
nnoremap <silent> <A-Left> :vertical resize -5<CR>
nnoremap <silent> <A-Right> :vertical resize +5<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <S-A> f <Plug>(coc-format-selected)
nmap <silent> <S-A> t :call CocAction('format')

" Popup Menu
hi Pmenu ctermfg=white ctermbg=black cterm=NONE guifg=#e1e1e1 guibg=#383838 gui=NONE
hi PmenuSel ctermfg=white ctermbg=black cterm=NONE guifg=#b26eff guibg=#4e4e4e gui=NONE

" Core configs
set noswapfile
set number
set ttyfast
set lazyredraw

autocmd BufEnter *.tpp :setlocal filetype=cpp

set completeopt=menuone,noinsert,noselect
set shortmess+=c

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

lua << EOF
require('nvim-autopairs').setup{}
EOF

set signcolumn=yes
