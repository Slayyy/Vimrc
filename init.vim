call plug#begin('~/.vim/plugged')

Plug 'icymind/NeoSolarized'
Plug 'danilo-augusto/vim-afterglow'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'elzr/vim-json'

Plug 'rking/ag.vim'


Plug 'ekalinin/Dockerfile.vim'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neoinclude.vim'



Plug 'fatih/vim-go'
Plug 'ryanoasis/vim-devicons'

Plug 'vivien/vim-linux-coding-style'

call plug#end()

set encoding=utf8
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11


" MAPPINGS
let mapleader = ","
noremap <C-e> :NERDTreeToggle<CR>
noremap <C-p> :FZF<CR>
noremap <S-h> :wa<CR>gT
noremap <S-l> :wa<CR>gt
noremap <C-f> :Ag<Space>
noremap <Leader>s :w<CR>
noremap <Leader>= gg=G
noremap <Leader>n :lnext<CR>
noremap <Leader>p :lprev<CR>
noremap <C-n> :tab split<CR>


set nu
set hlsearch

set incsearch
set termguicolors
colorscheme NeoSolarized
set background=dark

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" GO

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

" ALE
let g:ale_sign_column_always = 1

" DEOPLETE
call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])
let g:deoplete#enable_at_startup = 1

let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
let g:deoplete#sources#clang#clang_header = "/usr/lib/clang"
let g:neoinclude#paths = {'cpp' : '/usr/include/'}


if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set nowrap
