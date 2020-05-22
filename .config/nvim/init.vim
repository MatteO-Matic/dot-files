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
" Plug 'mklabs/split-term.vim'
" Debugging
" Plug 'vim-scripts/Conque-GDB'
" Plug 'dbgx/lldb.nvim'

" Completions and snippets
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets'
Plug 'godlygeek/tabular' " Align text
Plug 'Shougo/echodoc.vim' " retry

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
" Plug 'vim-scripts/gitignore'
Plug 'majutsushi/tagbar'
" Plug 'tmhedberg/SimpylFold'
" Plug 'Konfekt/FastFold'
" Plug 'airblade/vim-gitgutter'
" Plug 'vim-scripts/vim-svngutter'
Plug 'mhinz/vim-signify'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'jsfaint/gen_tags.vim'

" Hex editor
Plug 'fidian/hexmode'

" Python
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}

" c, cpp
Plug 'zchee/deoplete-clang', { 'for': ['cpp', 'c'] }
" Plug 'tweekmonster/deoplete-clang2', { 'for': ['cpp', 'c'] }
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


" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete:h12
set encoding=utf8

set splitbelow
set splitright

"set cmdheight=2 "give space for echodoc
set clipboard+=unnamedplus
" set clipboard^=unnamed,unnamedplus
set completeopt-=preview
set mouse=a    "Mouse in terminal
set noshowmode "Taken care of by airline
set lazyredraw
set hidden
set ruler
set ignorecase " for search patterns
set smartcase " don't ignore case if one capital is used
set magic
set showmatch
set nowb
set noerrorbells
set updatetime=2000 "Dead time before writing to swap

set smartindent " Indentation depending on filetype
set noexpandtab

set tabstop=4
set softtabstop=4
set shiftwidth=4

set number
set relativenumber
set numberwidth=2
set fileformat=unix

set whichwrap+=<,>,h,l


source ~/.config/nvim/keybindings.vim


" wildignoresettings
set wildignore+=.git,.svn,*.swp,*pyc,*pyo,*.png,*.jpg,*.gif,*.ai,*.jpeg,*.psd,*.jar,*.zip,*.gem,tmp/**,coverage/**,rdoc/**,output_*,*.xpi,doc/**,*.o

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

" Win10 finding double set of tags (it's looking for tags and TAGS; case insensitive)
set tags=tags

" NERDTree things
let NERDTreeWinPos='right'
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeRespectWildIgnore=0

" incsearch.vim
let g:incsearch#auto_nohlsearch = 1
set hlsearch

" git vim-fugitive
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set diffopt+=vertical

" fold settings
" let g:SimpylFold_docstring_preview = 1
" set foldlevelstart=4


" :make
set makeprg=nmake.exe

" Neomake settings
let g:neomake_open_list = 2

" let g:neomake_javascript_enabled_makers = ['eslint']

let g:neomake_error_sign = {
			\ 'text': 'X',
			\ 'texthl': 'NeomakeErrorSign',
			\ }
let g:neomake_warning_sign = {
			\   'text': 'W',
			\   'texthl': 'NeomakeWarningSign',
			\ }
let g:neomake_message_sign = {
			\   'text': '➤',
			\   'texthl': 'NeomakeMessageSign',
			\ }
let g:neomake_info_sign = {
			\ 'text': 'I',
			\ 'texthl': 'NeomakeInfoSign'
			\ }

" make write
" call neomake#configure#automake({
" 			\ 'BufWritePost': {'delay': 0},
" 			\ }, 500)

" || [main.cpp:89]: (style) Suspicious condition (assignment + comparison); Clarify expression with parentheses.
" || (information) Cppcheck cannot find all the include files (use --check-config for details)
 let g:neomake_cpp_cppcheck_maker = {
             \ 'args': ['--enable=all'],
             \ 'exe': 'cppcheck',
             \ 'errorformat':
			 \ '%-GChecking %f...,' .
			 \ '%-G(Information) Cppcheck cannot find %s,' .
             \ '%I[%f:%l]: (style) %m,' .
             \ '%W[%f:%l]: (warning) %m,' .
             \ '%E[%f:%l]: (error) %m,' .
			 \ '%E%m',
             \ }

 let g:neomake_c_cppcheck_maker = {
             \ 'args': ['--enable=all'],
             \ 'exe': 'cppcheck',
             \ 'errorformat':
			 \ '%-GChecking %f...,' .
			 \ '%-G(Information) Cppcheck cannot find %s,' .
             \ '%I[%f:%l]: (style) %m,' .
             \ '%W[%f:%l]: (warning) %m,' .
             \ '%E[%f:%l]: (error) %m,' .
			 \ '%E%m',
             \ }

 " \ '%-G%f:%s:,' .
 "\ 'remove_invalid_entries': 1,

 " let g:neomake_cpp_clang2_maker = {
 "             \ 'args': ['-fsyntax-only', '-std=c++98', '-Wall'],
 "             \ 'exe': 'clang++',
 " 			\ 'remove_invalid_entries': 1,
 "             \ 'errorformat':
 "             \ '%-G%f:%s:,' .
 "             \ '%f:%l:%c: %trror: %m,' .
 "             \ '%f:%l:%c: %tarning: %m,' .
 "             \ '%f:%l:%c: %m,'.
 "             \ '%f:%l: %trror: %m,'.
 "             \ '%f:%l: %tarning: %m,'.
 "             \ '%f:%l: %m',
 "             \ }



let g:neomake_cpp_clangcheck_maker = {
			 \ 'exe': 'clang-check',
			 \ 'args': ['-extra-arg=-UAPP_VERSION', '-extra-arg=-DAPP_VERSION="2.6.0"'],
			 \ 'errorformat':
			 \ '%E%f:%l:%c: fatal error: %m,' .
			 \ '%W%f:%l:%c: warning: %m,' .
			 \ '%E%f:%l:%c: error: %m,' .
			 \ '%-G%\m%\%%(LLVM ERROR:%\|No compilation database found%\)%\@!%.%#,' .
			 \ '%E%m',
			 \ }

let g:neomake_c_clangcheck_maker = {
			 \ 'exe': 'clang-check',
			 \ 'args': ['-extra-arg=-UAPP_VERSION', '-extra-arg=-DAPP_VERSION="2.6.0"'],
			 \ 'errorformat':
			 \ '%E%f:%l:%c: fatal error: %m,' .
			 \ '%E%f:%l:%c: error: %m,' .
			 \ '%W%f:%l:%c: warning: %m,' .
			 \ '%-G%\m%\%%(LLVM ERROR:%\|No compilation database found%\)%\@!%.%#,' .
			 \ '%E%m',
			 \ }


let g:neomake_c_clangtidy_maker = {
			 \ 'exe': 'clang-tidy',
			 \ 'args': ['-extra-arg=-UAPP_VERSION', '-extra-arg=-DAPP_VERSION="2.6.0"'],
			 \ 'errorformat':
			 \ '%E%f:%l:%c: fatal error: %m,' .
			 \ '%E%f:%l:%c: error: %m,' .
			 \ '%W%f:%l:%c: warning: %m,' .
			 \ '%-G%\m%\%%(LLVM ERROR:%\|No compilation database found%\)%\@!%.%#,' .
			 \ '%E%m',
			 \ }

let g:neomake_cpp_clangtidy_maker = {
            \ 'exe': 'clang-tidy',
            \ 'args': ['-extra-arg=-UAPP_VERSION', '-extra-arg=-DAPP_VERSION="2.6.0"'],
            \ 'errorformat':
            \ '%E%f:%l:%c: fatal error: %m,' .
            \ '%E%f:%l:%c: error: %m,' .
            \ '%W%f:%l:%c: warning: %m,' .
            \ '%-G%\m%\%%(LLVM ERROR:%\|No compilation database found%\)%\@!%.%#,' .
            \ '%E%m',
            \ }
" modernize-*
" readability-*



let g:neomake_cpp_enabled_makers = ['clangcheck']
let g:neomake_c_enabled_makers = ['clangcheck']

" Tagbar
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

let g:python3_host_prog = '/usr/bin/python3.6'

let g:deoplete#ignore_sources ={'_': ['tag']}
" let g:deoplete#tag#cache_limit_size = 30000
" let g:deoplate#max_list = 50 " default 500

" let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang'

" echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'virtual'
" highlight link EchoDocFloat Pmenu



" let g:deoplete#max_processes = 1

" deoplete clang2
" let g:deoplete#sources#clang#executable = '/usr/bin/clang'
" let g:deoplete#sources#clang#autofill_neomake = 1

let g:deoplete#sources#clang#std = {'c': 'c98', 'cpp': 'c++98', 'objc': 'c98', 'objcpp': 'c++1z'}
let g:deoplete#sources#clang#clang_complete_database = '/mnt/h/Project/'

" Signify
" let g:signify_difftool = 'diff'

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

" call neomake#configure#automake('w')
" call neomake#configure#automake('r', 0)
" call neomake#configure#automake('nrw', 1000)

function! <SID>StripTrailingWhitespaces()
	" save last search & cursor position
	let _s=@/
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	let @/=_s
	call cursor(l, c)
endfunction


augroup neovim
	autocmd!
	autocmd FileType vimfiler set nonumber | set norelativenumber
	autocmd Filetype * if &ft!='vimfiler' | set relativenumber | set number | endif
	autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
	autocmd StdinReadPre * let s:std_in=1
	" Remove whitespace if it's on the right(last) of pattern '/e'
	" autocmd BufWritePre *.{.cpp,.hpp,.c,.h,.py} %s/\s\+$//e
	" autocmd BufWritePre *.c,*.cpp,*.h,*.hpp,*.py call <SID>StripTrailingWhitespaces()

	autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
	autocmd! BufWritePost * Neomake " Build on write

augroup END

augroup quickfix
	" Quickfix / location list
	autocmd!

	autocmd Filetype qf setlocal foldmethod=expr
	autocmd FileType qf exe 'resize 8'
	autocmd FileType qf setlocal foldlevel=0
	autocmd FileType qf setlocal norelativenumber


	" autocmd BufReadPost quickfix setlocal foldmethod=expr
	" autocmd BufReadPost quickfix exe 'resize 8'
	" " autocmd BufReadPre * %s/\s\+$//e
	" " autocmd BufReadPost quickfix setlocal foldexpr=matchstr(getline(v:lnum),'^[^\|]\\+')==#matchstr(getline(v:lnum+1),'^[^\|]\\+')?1:'<1'
	" autocmd BufReadPost quickfix setlocal foldlevel=0
	" autocmd BufReadPost quickfix setlocal norelativenumber
augroup END


" wiki header colors
let g:vimwiki_hl_headers = 1
let wiki = {}
let wiki.path = '~/Documents/my_wiki/'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let g:vimwiki_list = [wiki]

" allow local config files
set exrc
" disable unsafe commands for any project local configs
set secure
