call plug#begin('~/.vim/plugged')

" COLOR THEMES
Plug 'icymind/NeoSolarized'
Plug 'dracula/vim'
Plug 'NLKNguyen/papercolor-theme'

" GUI
Plug 'chrisbra/Colorizer'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdcommenter'

" SNIPPETS
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" SYNTAX
Plug 'elzr/vim-json'
Plug 'ekalinin/Dockerfile.vim'

Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'

" LINT 
Plug 'w0rp/ale'

Plug 'Shougo/vimproc', {'do' : 'make'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" C & C++
Plug 'lyuts/vim-rtags'
"Plug 'vivien/vim-linux-coding-style'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Rip-Rip/clang_complete'


" GO
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}

"Python

Plug 'zchee/deoplete-jedi'
Plug 'python-mode/python-mode'





function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction


Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

call plug#end()

" --------------------SETTINGS--------------------

set encoding=utf8


" MAPPINGS
let mapleader = "\<Space>"
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
set foldenable  
set tabstop=4           " Render TABs using this many spaces.


highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

set incsearch
set termguicolors
colorscheme NeoSolarized
set background=dark
set cursorline


" ALE
let g:ale_sign_column_always = 1

" DEOPLETE
call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#enable_smart_case = 1


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

let g:deoplete#sources#go#package_dot = 1


" C & C++
autocmd FileType c,cpp :set expandtab
autocmd FileType c,cpp :set tabstop=2
autocmd FileType c,cpp :set shiftwidth=2


let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

" path to directory where library can be found
let g:clang_library_path='/usr/lib'

let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_omnicppcomplete_compliance = 0
let g:clang_make_default_keymappings = 0


" Python
let g:pymode_python = 'python3'




let $FZF_DEFAULT_COMMAND = 'ag -g ""'


if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

