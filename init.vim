call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'hashivim/vim-terraform'
Plug 'mhinz/vim-signify'
"Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-ruby/vim-ruby'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-ragtag'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'folke/tokyonight.nvim'
Plug 'neovim/nvim-lspconfig'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

" Leader/Keybindings
let mapleader = ','
" Copy to system clipboard
nnoremap <Leader>y "+yy
" Paste externally selected text
nnoremap <Leader>p "*p

nnoremap <Leader>g :GFiles<CR>

" Ariline pathing
let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'

set number
set relativenumber
set mouse=a
set clipboard=unnamed
syntax on
" colorscheme onedark
colorscheme tokyonight-storm

" NERDTree settings
nnoremap <F4> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
autocmd FileType nerdtree setlocal relativenumber
autocmd VimResized * wincmd =
nnoremap <Leader>h <C-W>h
nnoremap <Leader>l <C-W>l

" Terraform Auto-Format
let g:terraform_fmt_on_save=1
autocmd BufWritePre *.tf :TerraformFmt

" LSP Config
lua << EOF
require'lspconfig'.solargraph.setup {}
EOF

" Auto-complete pairs
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
