set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" " let Vundle manage Vundle
" " required! 
Bundle 'gmarik/vundle'
" Colour schemes
" " Bundle 'altercation/vim-colors-solarized'
Bundle 'morhetz/gruvbox'
Bundle 'zeis/vim-kolor'
" " Bundle 'xoria256.vim'
" " Language support
" Bundle 'c.vim'
" Bundle 'ibbo/mlint.vim'
" Bundle 'klen/python-mode'
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
Bundle 'bitc/vim-hdevtools'
Bundle 'Shougo/vimproc.vim'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'ujihisa/neco-ghc'
Bundle 'vim-pandoc/vim-pandoc'
" " Vim management
" Bundle 'Lokaltog/powerline'
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
" Bundle 'fholgado/minibufexpl.vim'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
" " Syntax completion
Bundle 'scrooloose/syntastic'
" Bundle 'Valloric/YouCompleteMe'
Bundle 'Shougo/neocomplete'
Bundle 'Shougo/neosnippet'
" Searching
" Bundle 'rking/ag.vim'
Bundle 'Shougo/unite.vim'


syntax enable
filetype indent on
filetype plugin on


set ttymouse=xterm2
set tags=./tags;
set mouse=a
set hidden
set colorcolumn=79
set cpoptions+=$
set tabstop=4                   "A tab is 4 spaces
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=4               "Insert 4 spaces when tab is pressed
set shiftwidth=4                "An indent is 4 spaces
set smarttab                    "Indent instead of tab at start of line
set shiftround                  "Round spaces to nearest shiftwidth multiple
set nojoinspaces                "Don't convert spaces to tabs
set autoindent
set smartindent
set showmatch
set ruler
set hlsearch
set modeline
set ls=2
" set listchars=tab:▒░,trail:▓
" set list
" Vim special files
set noswapfile
set backupdir=~/.vim-swp/
set directory=~/.vim-swp/

set grepprg=grep\ -nH\ $*

let mapleader=","

" colour schemes
set bg=dark
" colorscheme gruvbox
colorscheme kolor

" airline
"let g:airline_powerline_fonts = 1

" Fugitive plugin
set statusline=%{fugitive#statusline()}

" LaTeX Options
let g:tex_flavor='latex'
" Haskell
au FileType haskell set number
au FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType haskell nnoremap <buffer> <F3> :GhcModLint<CR>
autocmd FileType haskell nnoremap <buffer> <F4> :GhcModCheck<CR>
autocmd FileType haskell nnoremap <buffer> <F5> :HdevtoolsType<CR>
autocmd FileType haskell nnoremap <buffer> <F6> :HdevtoolsClear<CR>
" MATLAB
let g:mlint_path_to_mlint='/home/oz/bin/mlint'

" YCM
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" Neocomplete
let g:neocomplete#enable_at_startup = 1

" Tagbar
nnoremap <leader>tb :TagbarToggle<CR>
nmap <F8> :TagbarToggle<CR>

" NERDTree
nnoremap <leader>nt :NERDTreeToggle<CR>

" Vim shortcuts
inoremap ;; <Esc>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
" Spell check
nnoremap <leader>sp :setlocal spell! spelllang=en_gb<CR>

function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()

"neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" unite.vim
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#set_profile('files', 'smartcase', 1)
call unite#custom#source('line,outline','matchers','matcher_fuzzy')

let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable=1
let g:unite_source_rec_max_cache_files=5000
let g:unite_prompt='» '

if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
  let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
  let g:unite_source_grep_command='ack'
  let g:unite_source_grep_default_opts='--no-heading --no-color -a -C4'
  let g:unite_source_grep_recursive_opt=''
endif

function! s:unite_settings()
        nmap <buffer> Q <plug>(unite_exit)
        nmap <buffer> <esc> <plug>(unite_exit)
        imap <buffer> <esc> <plug>(unite_exit)
endfunction
autocmd FileType unite call s:unite_settings()
nmap <space> [unite]
nnoremap [unite] <nop>

nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec/async buffer file_mru bookmark<cr><c-u>
nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async<cr><c-u>
nnoremap <silent> [unite]d :<C-u>Unite -toggle -auto-resize -buffer-name=files_in_pwd file<cr><c-u>
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<cr>
nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>
