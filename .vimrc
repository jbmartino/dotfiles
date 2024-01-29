call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'hashivim/vim-terraform'
Plug 'airblade/vim-gitgutter'
Plug 'vim-ruby/vim-ruby'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-ragtag'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

set relativenumber

set clipboard=unnamed
syntax on
colorscheme onedark

" NERDTree settings
nnoremap <F4> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
autocmd VimResized * wincmd =

" Terraform Auto-Format
let g:terraform_fmt_on_save=1
autocmd BufWritePre *.tf :TerraformFmt

