" NeoBundle Scripts-----------------------------
if has('vim_starting')  
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
  set runtimepath+=~/.config/nvim/
endif

let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)  
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.config/nvim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif

call neobundle#begin(expand('$HOME/.config/nvim/bundle'))  
NeoBundleFetch 'Shougo/neobundle.vim'

" ------------------------------------
" THIS IS WHERE YOUR PLUGINS WILL COME
" ------------------------------------
NeoBundle 'neomake/neomake'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
"NeoBundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

NeoBundle 'Valloric/YouCompleteMe', {  
     \ 'build'      : {
        \ 'mac'     : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'unix'    : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'cygwin'  : './install.sh --clang-completer --system-libclang --omnisharp-completer'
        \ }
     \ }

NeoBundle 'tpope/vim-surround'

call neobundle#end()  
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck  
"End NeoBundle Scripts-------------------------


set number
"autocmd! BufWritePost,BufEnter * Neomake

"set statusline+=\ %#ErrorMsg#%{neomake#statusline#QflistStatus('qf:\ ')}


augroup vimrc_neomake
  au!
  autocmd BufWritePost * Neomake
augroup END```

let g:neomake_open_list = 2

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd WinEnter * if &buftype ==# 'quickfix' && winnr('$') == 1 | quit | endif

"Remove trailing whitespaces from python files
autocmd BufWritePre *.py :%s/\s\+$//e

let g:powerline_pycmd = "py3"
