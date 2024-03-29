call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'hashivim/vim-terraform'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-ruby/vim-ruby'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-ragtag'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

" Leader/Keybindings
let mapleader = ','
" Copy to system clipboard
nnoremap <Leader>y "+yy
" Paste externally selected text
nnoremap <Leader>p "*p

" NERDTree Window navigation Left/Right
nnoremap <Leader>h <C-W>h
nnoremap <Leader>l <C-W>l

nnoremap <Leader>g :GFiles<CR>

" Ariline pathing
let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'

set number
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
