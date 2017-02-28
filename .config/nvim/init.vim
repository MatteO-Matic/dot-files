
" vim-plug autoconfig if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | nested source $MYVIMRC
endif


" startup for vim-plug
call plug#begin('~/.config/nvim/plugged')
" Terminal
Plug 'mklabs/split-term.vim'

" Completions and snippets
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets'

" Helpers
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-surround'
Plug 'matchit.zip'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kassio/neoterm'
Plug 'edkolev/promptline.vim'
Plug 'xolox/vim-misc' | Plug 'xolox/vim-session'

" IDE
Plug 'joshdick/onedark.vim'

Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTree'] }
Plug 'neomake/neomake'
Plug 'Shougo/unite.vim'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'gitignore'
Plug 'majutsushi/tagbar'
Plug 'indentpython.vim'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
Plug 'airblade/vim-gitgutter'
Plug 'miyakogi/seiya.vim'

" Python
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
" Javascript
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/html5.vim'
" javascript linter
" Plug 'eslint/eslint'

" Syntax helpers
Plug 'pearofducks/ansible-vim', { 'for': 'ansible' }
Plug 'freitass/todo.txt-vim', { 'for': 'todo.txt' }
Plug 'sheerun/vim-polyglot'

call plug#end()

" let g:neomake_javascript_enabled_makers = ['eslint']

" let g:python_host_prog = '/usr/bin/python'
" let g:python2_host_prog = '/usr/bin/python27'
" let g:python3_host_prog = '/usr/bin/python3.5'

set splitbelow
set splitright

set clipboard+=unnamedplus
set completeopt-=preview
set noshowmode
set lazyredraw
set hidden
set ruler
set noswapfile
set ignorecase
set smartcase
set magic
set showmatch
set nobackup
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

let mapleader = "\<Space>"

" wildignoresettings
" set wildignore+=.git,*.swp,*pyc,*pyo,*.png,*.jpg,*.gif,*.ai,*.jpeg,*.psd,*.jar,*.zip,*.gem,log/**,tmp/**,coverage/**,rdoc/**,output_*,*.xpi,doc/**

" python special settings
au BufNewFile,BufRead *.py set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79

nnoremap <silent> <A-right> :bn<CR>
nnoremap <silent> <A-left> :bp<CR>

" neovim terminal
tnoremap <Esc> <C-\><C-n>

" conceal markers
if has('conceal')
  set conceallevel=2
endif

" NERDTree things
let NERDTreeWinPos='right'
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeRespectWildIgnore=1
map <C-f> :NERDTreeToggle<CR>

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
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>

" fold settings
" let g:SimpylFold_docstring_preview = 1
set foldlevelstart=4


" Neomake settings
let g:neomake_open_list = 2
""""""""""""""""""""""""""""""""""""""""

" TagBar
nmap <C-t> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" alt+arrow to move around in split windows
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

" vim-airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'dark'
let g:airline_powerline_fonts = 1

" themes and colors
" let NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" set termguicolors
let g:onedark_termcolors = 256
set background=dark
colorscheme onedark
" let g:seiya_auto_enable=1
" let g:seiya_target_groups = ['guibg']

" unite vim
let g:unite_source_grep_command = 'ack-grep'
let g:unite_source_grep_default_opts ='-i --no-heading --no-color -k -H'
let g:unite_source_grep_recursive_opt = ''

" fzf.vim
nnoremap <C-p> :Files<cr>

" session management
let g:session_autosave = 'no'

" deoplete + neosnippet + autopairs changes
let g:AutoPairsMapCR=0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1


imap <expr><TAB> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>")
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>\<Plug>AutoPairsReturn"

augroup neovim
  autocmd!
  autocmd FileType vimfiler set nonumber | set norelativenumber
  autocmd Filetype * if &ft!='vimfiler' | set relativenumber | set number | endif
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
  autocmd StdinReadPre * let s:std_in=1
  autocmd BufWritePre * %s/\s\+$//e
  autocmd BufWritePost * Neomake
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END
