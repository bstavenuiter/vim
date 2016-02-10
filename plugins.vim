set nocompatible "Latest vim settings and options
set t_Co=256

" set the runtime path to include Vundle and initialize
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" vim surroudn to quickly surround quotes etc
Plugin 'tpope/vim-surround'

" able to repeat inside plugins 
Plugin 'tpope/vim-repeat'

" able to use emmet short syntax
Plugin 'mattn/emmet-vim'

" able to quickly comment out/in source code
Plugin 'scrooloose/nerdcommenter'

" use tabs for autocompletion
Plugin 'ervandew/supertab'

" brows files like finder
Plugin 'scrooloose/nerdtree'

" GIT integration 
Plugin 'tpope/vim-fugitive'

" Fuzzy find you files
Plugin 'kien/ctrlp.vim'

" Close buffers without messing around with your windows
Plugin 'moll/vim-bbye'

" Close buffers without messing around with your windows
Plugin 'qpkorr/vim-bufkill'

" Snippets!
Plugin 'SirVer/ultisnips'

call vundle#end()

"ignore other plugin indent changes
filetype plugin on
