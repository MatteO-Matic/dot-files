" ================ Plugins ====================

" vim-plug autoconfig if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | nested source $MYVIMRC
endif

filetype plugin on

" startup for vim-plug
call plug#begin('~/.config/nvim/plugged')
" Terminal
Plug 'mklabs/split-term.vim'
" Debugging
" Plug 'vim-scripts/Conque-GDB'
Plug 'critiqjo/lldb.nvim'

" Completions and snippets
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets'

" Search
Plug 'henrik/vim-indexed-search'
Plug 'haya14busa/incsearch.vim'

" Helpers
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'edkolev/promptline.vim'
Plug 'xolox/vim-misc' | Plug 'xolox/vim-session'

" Theme
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'blueyed/vim-diminactive'

" IDE
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTree'] }
Plug 'neomake/neomake'
Plug 'Shougo/unite.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/gitignore'
Plug 'majutsushi/tagbar'
" Plug 'tmhedberg/SimpylFold'
" Plug 'Konfekt/FastFold'
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'

" Hex editor
Plug 'fidian/hexmode'

" Python
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}

" c, cpp
Plug 'zchee/deoplete-clang', { 'for': ['cpp', 'c'] }
Plug 'zchee/libclang-python3', { 'for': ['cpp', 'c'] }
" Plug 'ericcurtin/CurtineIncSw.vim', { 'for': ['cpp', 'c', 'h', 'hpp'] }
Plug 'vim-scripts/a.vim'

" Javascript / html
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/html5.vim'
" javascript linter
" Plug 'eslint/eslint'

" Syntax helpers
Plug 'vitalk/vim-simple-todo', { 'for': 'txt' } " Fix me
Plug 'sheerun/vim-polyglot'
Plug 'vimwiki/vimwiki'
call plug#end()


" Ruler options
if exists('+colorcolumn')
    let &colorcolumn="80,".join(range(120,999),",")
    let &colorcolumn="80"
    highlight ColorColumn ctermbg=9 guibg=#df0000
else
    " fallback for Vim < v7.3
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif


set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h12
set encoding=utf8

set splitbelow
set splitright

set clipboard+=unnamedplus
set completeopt-=preview
set mouse=a    "Mouse in terminal
set noshowmode "Taken care of by airline
set lazyredraw
set hidden
set ruler
set smartindent " Indentation depending on filetype
set ignorecase " for search patterns
set smartcase " don't ignore case if one capital is used
set magic
set showmatch
set nowb
set noerrorbells
set expandtab
set updatetime=2000 "Dead time before writing to swap

set tabstop=2
set softtabstop=2
set shiftwidth=2

set number
set relativenumber
set numberwidth=2
set fileformat=unix

set whichwrap+=<,>,h,l


source ~/.config/nvim/keybindings.vim


" wildignoresettings
 set wildignore+=.git,*.swp,*pyc,*pyo,*.png,*.jpg,*.gif,*.ai,*.jpeg,*.psd,*.jar,*.zip,*.gem,log/**,tmp/**,coverage/**,rdoc/**,output_*,*.xpi,doc/**

" python special settings
"au BufNewFile,BufRead *.py set
"    \ tabstop=4
"    \ softtabstop=4
"    \ shiftwidth=4
"    \ textwidth=79
" conceal markers

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


" NERDTree things
let NERDTreeWinPos='right'
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeRespectWildIgnore=1

" incsearch.vim
let g:incsearch#auto_nohlsearch = 1
set hlsearch

" git vim-fugitive
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set diffopt+=vertical

" fold settings
" let g:SimpylFold_docstring_preview = 1
" set foldlevelstart=4


" Neomake settings
let g:neomake_open_list = 2

" let g:neomake_javascript_enabled_makers = ['eslint']

let g:neomake_cpp_clang_maker = {
            \ 'args': ['-fsyntax-only', '-std=c++14', '-Wall'],
            \ 'exe': 'clang++',
            \ 'errorformat':
            \ '%-G%f:%s:,' .
            \ '%f:%l:%c: %trror: %m,' .
            \ '%f:%l:%c: %tarning: %m,' .
            \ '%f:%l:%c: %m,'.
            \ '%f:%l: %trror: %m,'.
            \ '%f:%l: %tarning: %m,'.
            \ '%f:%l: %m',
            \ }
let g:neomake_cpp_clangtidy_maker = {
            \ 'exe': 'clang-tidy',
            \ 'args': ['--checks="modernize-*,readability-*,misc-*,clang-analyzer-*"'],
            \ 'errorformat':
            \ '%E%f:%l:%c: fatal error: %m,' .
            \ '%E%f:%l:%c: error: %m,' .
            \ '%W%f:%l:%c: warning: %m,' .
            \ '%-G%\m%\%%(LLVM ERROR:%\|No compilation database found%\)%\@!%.%#,' .
            \ '%E%m',
            \ }
let g:neomake_cpp_enabled_makers = ['clangtidy']


let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1


" vim-airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1

" themes and colors
" let NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" set termguicolors
let g:onedark_termcolors = 256
set background=dark
let g:one_allow_italics = 1
colorscheme onedark

" set terminal title/name to filename
set title " Allows to set the titlestring
autocmd BufEnter * let &titlestring = "vim(" . expand("%:t") . ")"


" unite vim
" let g:unite_source_grep_command = 'ack-grep'
" let g:unite_source_grep_default_opts ='-i --no-heading --no-color -k -H'
" let g:unite_source_grep_recursive_opt = ''


" session management
let g:session_autosave = 'no'

" deoplete + neosnippet + autopairs changes
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1


" clang
if !empty(glob("/usr/lib64/libclang.so")) " Try to find the libclang lib
  let g:deoplete#sources#clang#libclang_path = '/usr/lib64/libclang.so'
  let g:deoplete#sources#clang#clang_header = '/usr/lib64/clang'
elseif !empty(glob("/usr/lib/libclang.so"))
  let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
  let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
else
  echo "Can't find libclang!"
endif

let g:deoplete#sources#clang#std = {'c': 'c11', 'cpp': 'c++14', 'objc': 'c11', 'objcpp': 'c++1z'}

" neosnippet key-mappings
" SuperTab like snippets behavior
let g:AutoPairsMapCR=0

let g:neosnippet#expand_word_boundary = 1

" conceal neosnippet markers
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" allow automatic function signature expansion
let g:neosnippet#enable_completed_snippet=1


augroup neovim
  autocmd!
  autocmd FileType vimfiler set nonumber | set norelativenumber
  autocmd Filetype * if &ft!='vimfiler' | set relativenumber | set number | endif
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
  autocmd StdinReadPre * let s:std_in=1
  " Remove whitespace if it's on the right(last) of pattern '/e'
  autocmd BufWritePre * %s/\s\+$//e
  autocmd! BufWritePost * Neomake " Build on write
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

" wiki header colors
let g:vimwiki_hl_headers = 1
let wiki = {}
let wiki.path = '~/Documents/my_wiki/'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let g:vimwiki_list = [wiki]

