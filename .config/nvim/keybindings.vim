let mapleader = ","

function! s:is_whitespace()
	let col = col('.') - 1
	return ! col || getline('.')[col - 1] =~? '\s'
endfunction

" TagBar
nmap <C-t> :TagbarToggle<CR>

" neovim terminal, go out from insert mode
tnoremap <Esc> <C-\><C-n>

" alt+arrow to move around in split windows
" alt + movement
nnoremap <silent> <A-l> <c-w>l
nnoremap <silent> <A-h> <c-w>h
nnoremap <silent> <A-k> <c-w>k
nnoremap <silent> <A-j> <c-w>j
" Move left/right in buffers
nnoremap <silent> <A-right> :bn<CR>
nnoremap <silent> <A-left> :bp<CR>
nnoremap <silent> <C-l> :bn<CR>
nnoremap <silent> <C-h> :bp<CR>

" fzf.vim
nnoremap <C-p> :Files<cr>

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" NERDTree
map <C-n> :NERDTreeToggle<CR>
" map  <C-l> :tabn<CR>
" map  <C-h> :tabp<CR>
" map  <C-n> :tabnew<CR>

" I think I'll mostly be using buffers
" noremap <leader>q :quit<CR>
noremap <leader>q :bd<CR>
vnoremap <leader>s :sort<CR>
" List buffers
nnoremap <Leader>b :ls<CR>:b<Space>
" Toggle cpp/h
nnoremap <leader>t :A<CR>

nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lp :lprev<CR>

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
nnoremap <F17> :LLmode code<CR> " <S-F5>
nnoremap <F9> :LL continue<CR>
nnoremap <F21> :LL process interrupt<CR> " <S-F9>

nnoremap <F7> :LL s<CR> " step
nnoremap <F8> :LL n<CR>

nnoremap <leader>dp :LL print <C-R>=expand('<cword>')<CR><CR>
vnoremap <leader>dp :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR><CR>
nmap <leader>dbt :LL bt<CR>

" git vim-fugitive
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gps :Git push<CR>
nnoremap <leader>gpl :Git pull<CR>

" more comfy indentation
vnoremap < <gv
vnoremap > >gv

" neosnippet

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Use <CR> to expand snippets
imap <expr><CR>  pumvisible() ?
\ (neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : deoplete#mappings#close_popup()."\<CR>") :
\ "\<CR>\<Plug>AutoPairsReturn"

imap <expr><CR>  pumvisible() ?
\ (neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : deoplete#mappings#close_popup()) :
\ "\<CR>\<Plug>AutoPairsReturn"

" <Tab> completion:
" 1. If popup menu is visible, select and insert next item
" 2. Otherwise, if within a snippet, jump to next input
" 3. Otherwise, if preceding chars are whitespace, insert tab char
" 4. Otherwise, start manual autocomplete
imap <silent><expr><Tab> pumvisible() ? "\<Down>"
	\ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
	\ : (<SID>is_whitespace() ? "\<Tab>"
	\ : deoplete#manual_complete()))

smap <silent><expr><Tab> pumvisible() ? "\<Down>"
	\ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
	\ : (<SID>is_whitespace() ? "\<Tab>"
	\ : deoplete#manual_complete()))

inoremap <expr><S-Tab> pumvisible() ? "\<Up>" : "\<C-h>"
