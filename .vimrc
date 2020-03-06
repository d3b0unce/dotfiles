" Vundle configuration
set nocompatible              " be iMproved, required
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'RRethy/vim-illuminate'
call vundle#end()

syntax on
set shiftwidth=2
set ai
set number
set hlsearch
set ruler
set ignorecase
highlight Comment ctermfg=green

" keys
map <C-n> :NERDTreeToggle<CR>

