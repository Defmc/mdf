" Plugins
call plug#begin()
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim'

" Editor
Plug 'windwp/nvim-autopairs'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'

" Highlighting
Plug 'cespare/vim-toml', {'branch': 'master'}
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
nnoremap <silent> <space>e :NvimTreeToggle<CR>

nnoremap <silent> <C-v> a<C-r>+<Esc>
inoremap <silent> <C-v> <C-r>+
cnoremap <silent> <C-v> <C-r>+

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

set completeopt=menuone,noinsert,noselect
set shortmess+=c

lua << EOF
require('nvim-autopairs').setup{}
EOF

set signcolumn=yes
