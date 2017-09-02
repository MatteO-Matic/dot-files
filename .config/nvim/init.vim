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

" Javascript
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


" let g:python_host_prog = '/usr/bin/python'
" let g:python2_host_prog = '/usr/bin/python27'
" let g:python3_host_prog = '/usr/bin/python3.5'


function! s:is_whitespace()
	let col = col('.') - 1
	return ! col || getline('.')[col - 1] =~? '\s'
endfunction

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
set noshowmode
set lazyredraw
set hidden
set ruler
" set noswapfile
" set nobackup
set smartindent " Indentation depending on filetype
set ignorecase " for search patterns
set smartcase " don't ignore case if one capital is used
set magic
set showmatch
set nowb
set noerrorbells
set expandtab
set updatetime=250

set tabstop=2
set softtabstop=2
set shiftwidth=2

set number
set relativenumber
set numberwidth=2
set fileformat=unix

set whichwrap+=<,>,h,l

let mapleader = ","


" wildignoresettings
 set wildignore+=.git,*.swp,*pyc,*pyo,*.png,*.jpg,*.gif,*.ai,*.jpeg,*.psd,*.jar,*.zip,*.gem,log/**,tmp/**,coverage/**,rdoc/**,output_*,*.xpi,doc/**

" python special settings
"au BufNewFile,BufRead *.py set
"    \ tabstop=4
"    \ softtabstop=4
"    \ shiftwidth=4
"    \ textwidth=79

" Move left/right in buffers
nnoremap <silent> <A-right> :bn<CR>
nnoremap <silent> <A-left> :bp<CR>

nnoremap <silent> <C-l> :bn<CR>
nnoremap <silent> <C-h> :bp<CR>

" neovim terminal, go out from insert mode
tnoremap <Esc> <C-\><C-n>

" conceal markers
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" NERDTree things
let NERDTreeWinPos='right'
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeRespectWildIgnore=1
map <C-n> :NERDTreeToggle<CR>

" incsearch.vim
let g:incsearch#auto_nohlsearch = 1
set hlsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" nerdtree settings
" map  <C-l> :tabn<CR>
" map  <C-h> :tabp<CR>
" map  <C-n> :tabnew<CR>


" fold settings
" let g:SimpylFold_docstring_preview = 1
" set foldlevelstart=4


" Neomake settings
let g:neomake_open_list = 2
" let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_cpp_enable_markers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++14", "-Wextra", "-Wall", "-fsanitize=undefined","-g"]


" TagBar
nmap <C-t> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

" alt+arrow to move around in split windows
" alt + movement
nnoremap <silent> <A-l> <c-w>l
nnoremap <silent> <A-h> <c-w>h
nnoremap <silent> <A-k> <c-w>k
nnoremap <silent> <A-j> <c-w>j

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


" unite vim
" let g:unite_source_grep_command = 'ack-grep'
" let g:unite_source_grep_default_opts ='-i --no-heading --no-color -k -H'
" let g:unite_source_grep_recursive_opt = ''

" fzf.vim
nnoremap <C-p> :Files<cr>

" session management
let g:session_autosave = 'no'

" deoplete + neosnippet + autopairs changes
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" clang
if !empty(glob("/usr/lib64/libclang.so"))
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
imap <expr><CR>  pumvisible() ?
\ (neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : deoplete#mappings#close_popup()."\<CR>") :
\ "\<CR>\<Plug>AutoPairsReturn"


imap <expr><TAB> pumvisible() ? "\<C-n>" :
\ neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)" :
\ <SID>is_whitespace() ? "\<TAB>" : deoplete#mappings#manual_complete()

" Go back with shift tab or C-p
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"

smap <expr><TAB> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_jump)"
\: "\<TAB>"

let g:neosnippet#expand_word_boundary = 1
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
xmap <TAB> <Plug>(neosnippet_expand_target)

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
  " autocmd BufWritePost * Neomake " Build on write
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

" wiki header colors
let g:vimwiki_hl_headers = 1

" I think I'll mostly be using buffers
" noremap <leader>q :quit<CR>
noremap <leader>q :bd<CR>
vnoremap <leader>s :sort<CR>
" List buffers
nnoremap <Leader>b :ls<CR>:b<Space>

" Toggle cpp/h
nnoremap <leader>t :A<CR>

" gdb / Conque / neogdb
"nnoremap <silent> <Leader>Y :ConqueGdbCommand y<CR>
"nnoremap <silent> <Leader>N :ConqueGdbCommand n<CR>
"nnoremap <Leader>c :ConqueGdbCommand<Space>
"let g:ConqueTerm_Color = 2 " 1: strip color after 200 lines, 2: always with color
"let g:ConqueTerm_CloseOnEnd = 1 " close conque when program ends running
"let g:ConqueTerm_ReadUnfocused = 1      "Update unfocused buffers
" let g:ConqueTerm_StartMessages = 0
"let g:ConqueGdb_Leader = '\'
"let g:ConqueGdb_Run = g:ConqueGdb_Leader . 'r'
"let g:ConqueGdb_Continue = g:ConqueGdb_Leader . 'c'
"let g:ConqueGdb_Next = g:ConqueGdb_Leader . 'n'
"let g:ConqueGdb_Step = g:ConqueGdb_Leader . 's'
"let g:ConqueGdb_Print = g:ConqueGdb_Leader . 'p'
"let g:ConqueGdb_ToggleBreak = g:ConqueGdb_Leader . 'b'
"let g:ConqueGdb_DeleteBreak = g:ConqueGdb_Leader . 'd'
"let g:ConqueGdb_Finish = g:ConqueGdb_Leader . 'f'
"

" lldb
nmap <F2> <Plug>LLBreakSwitch
" vmap <F2> <Plug>LLStdInSelected
" nnoremap <F4> :LLstdin<CR>
nnoremap <F5> :LLmode debug<CR>
nnoremap <S-F5> :LLmode code<CR>
nnoremap <F9> :LL continue<CR>
nnoremap <S-F9> :LL process interrupt<CR>

nnoremap <F7> :LL s<CR>
nnoremap <F8> :LL n<CR>

nnoremap <leader>dp :LL print <C-R>=expand('<cword>')<CR><CR>
vnoremap <leader>dp :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR><CR>
nmap <leader>dbt :LL bt<CR>




" git vim-fugitive
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gps :Git push<CR>
nnoremap <leader>gpl :Git pull<CR>

" more comfy indentation
vnoremap < <gv
vnoremap > >gv
