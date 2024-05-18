source ~/AppData/Local/nvim/rc/dein.vim
"source ~/AppData/Local/nvim/rc/dpp.vim

colorscheme habamax

set noswapfile
set number
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set breakindent
set nowrap
set termguicolors
set background=dark
set noshowmode

hi StatusLine guifg=#1c1c1c guibg=#767676

nnoremap ss <Cmd>split<CR>
nnoremap sv <Cmd>vsplit<CR>

nnoremap <Space> <C-w>w
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l

nnoremap * *N
