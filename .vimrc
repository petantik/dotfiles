let &t_Co=256
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'xolox/vim-lua-ftplugin'
Bundle 'c.vim'
Bundle 'mlint.vim--Ibbotson'
Bundle 'klen/python-mode'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'lukerandall/haskellmode-vim'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'ujihisa/neco-ghc'
Bundle 'xoria256.vim'
Bundle 'MatlabFilesEdition'
Bundle 'L9'
"Bundle 'FuzzyFinder'
Bundle 'kien/ctrlp.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/vimproc'
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'

colors xoria256
set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
filetype plugin on
filetype indent on
syntax on

set ttymouse=xterm2
set nocompatible
set colorcolumn=79
set cpoptions+=$
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set showmatch
set ruler
set hlsearch
set modeline
set ls=2
" set statusline=%{fugitive#statusline()}
let g:neocomplcache_enable_at_startup = 1
" set spell spelllang=en_gb
nmap <F8> :TagbarToggle<CR>
" LaTeX Options
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:mlint_path_to_mlint='/home/oz/bin/mlint'
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
nnoremap ,sp :setlocal spell! spelllang=en_gb<CR>
nnoremap ,tb :TagbarToggle<CR>
nnoremap ,nt :NERDTreeToggle<CR>
inoremap ;; <Esc>
" Haskell
au BufEnter *.hs compiler ghc
let g:haddock_browser="/usr/bin/firefox"

